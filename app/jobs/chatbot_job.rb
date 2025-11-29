class ChatbotJob < ApplicationJob
  queue_as :default

  def perform(question)
    @question = question
    chatgpt_response = client.chat(
      parameters: {
        model: "gpt-4o-mini",
        messages: questions_formatted_for_openai # to code as private method
      }
    )
    new_content = chatgpt_response["choices"][0]["message"]["content"]

    question.update(ai_answer: new_content)
    Turbo::StreamsChannel.broadcast_update_to(
      "question_#{@question.id}",
      target: "question_#{@question.id}",
      partial: "questions/question", locals: { question: question })
  end

  private

  def client
    @client ||= OpenAI::Client.new
  end

  private

  def questions_formatted_for_openai
    questions = @question.user.questions
    results = []
    results << {
      role: "system",
      content: <<~PROMPT
      You are VeinBot, an AI assistant for VeinConnect - a blood donation platform in Mauritius.

      Guidelines:
      1. Provide accurate information about blood donation eligibility, procedures, and safety
      2. Help users understand blood types and compatibility
      3. Guide users to appropriate resources for urgent medical needs
      4. Be empathetic, professional, and concise
      5. If unsure, direct users to healthcare professionals

      Blood Donation Facts:
      - Eligibility: 18-65 years, >50kg, good health, no recent illnesses
      - Frequency: Every 3 months for whole blood donation
      - Blood Types: A+, A-, B+, B-, O+, O-, AB+, AB-
      - O- is universal donor, often in high demand
      - Preparation: Hydrate well, eat iron-rich foods
    PROMPT
    }
      questions.each do |question|
      results << { role: "user", content: question.user_question }
      results << { role: "assistant", content: question.ai_answer || "" }
    end
    return results
  end
end
