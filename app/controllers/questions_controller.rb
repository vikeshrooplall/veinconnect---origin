class QuestionsController < ApplicationController
  before_action :set_questions, only: [:index, :create]
  before_action :set_question, only: [:show, :status]
  def index
    @questions = current_user.questions
    @question = Question.new # for form

    respond_to do |format|
      format.html  #render full page
      # handle different response formats (HTML, JSON, etc.)
      format.json do
        # For modal: return JSON with questions history
        render json: {
          questions: @questions.as_json(only: [:id, :user_question, :ai_answer, :created_at]),
          # modal chat to load existing questions without full page reload
        }
      end
    end
  end

  def create
    @questions = current_user.questions # needed in case of validation error
    @question = Question.new(question_params)
    @question.user = current_user
    if @question.save
      # handle different response formats (HTML, JSON, etc.)
      respond_to do |format|
        # For Turbo Stream requests (Hotwire's real-time updates)
        format.turbo_stream do
          render turbo_stream: [
            # Appends the new question to element with ID questions
            turbo_stream.append(:questions, partial: "questions/question",
              locals: { question: @question }),
            # Updates element with ID modal-questions with refreshed list
            turbo_stream.update("modal-questions",
              partial: "questions/list",
              locals: { questions: current_user.questions.reload })
          ]
        end
        # For AJAX requests from modal
        format.json do
          # Returns success status, question data
          render json: {
            success: true,
            question: {
              id: @question.id,
              user_question: @question.user_question,
              ai_answer: @question.ai_answer || "AI is thinking...",
              created_at: @question.created_at,
              status: @question.ai_answer.present? ? 'completed' : 'processing'
            }
          }
        end
      end
    else
      @questions = current_user.questions
      respond_to do |format|
        # error messages
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace(
            "question_form",
            partial: "questions/form",
            locals: { question: @question }
          ), status: :unprocessable_entity
        end
        # Returns validation errors as JSON array
        format.json do
          render json: { errors: @question.errors.full_messages }, status: :unprocessable_entity
        end
        # Re-renders index page with error messages
        format.html { render :index, status: :unprocessable_entity }
      end
    end
  end

  def clear
    current_user.questions.destroy_all
    redirect_to questions_path, notice: "Chat history cleared"
  end

  def show
    respond_to do |format|
      format.json do
        render json: {
          question: {
            id: @question.id,
            user_question: @question.user_question,
            ai_answer: @question.ai_answer,
            created_at: @question.created_at
          }
        }
      end
    end
  end

  def status
    respond_to do |format|
      format.json do
        render json: {
          id: @question.id,
          ai_answer: @question.ai_answer || "Still processing...",
          completed: @question.ai_answer.present?,
          updated_at: @question.updated_at
        }
      end
    end
  end

  private

  def question_params
    params.require(:question).permit(:user_question)
  end

  # Fetches all questions for current user
  def set_questions
    @questions = current_user.questions.order(created_at: :asc)
  end

  def set_question
    @question = current_user.questions.find(params[:id])
  end
end
