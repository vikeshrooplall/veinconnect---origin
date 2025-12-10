// app/javascript/controllers/chat_modal_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  // data targets (DOM elements the controller needs to reference)
  static targets = ["modal", "messages", "input", "form", "notification"]
  // controller connects to DOM element
  connect() {
    // Loads existing chat history from server when modal first connects
    console.log("Chat modal controller connected")
    this.pollInterval = null
    this.loadQuestions()


    // Listen for Turbo Stream updates
    document.addEventListener("turbo:before-stream-render", (event) => {
      console.log("Turbo stream event received:", event.detail.newStream)
      this.handleTurboStream(event)
    })

    this.setupTouchGestures()
  }

  disconnect() {
    if (this.pollInterval) {
      clearInterval(this.pollInterval)
      this.pollInterval = null
    }
  }

  setupTouchGestures() {
    let startX = 0
    let startY = 0

    // Listen for touch start on modal
    this.modalTarget.addEventListener('touchstart', (e) => {
      startX = e.touches[0].clientX
      startY = e.touches[0].clientY
    })

    // Listen for touch end
    this.modalTarget.addEventListener('touchend', (e) => {
      if (!this.modalTarget.classList.contains('hidden')) {
        const endX = e.changedTouches[0].clientX
        const endY = e.changedTouches[0].clientY

        // If user swipes down significantly, close modal
        if (startY < endY && (endY - startY) > 100) {
          this.close()
        }
      }
    })
  }
  // Modal Controls
  // Shows/hides the modal
  toggle() {
    this.modalTarget.classList.toggle("hidden")

    if (!this.modalTarget.classList.contains("hidden")) {
      this.inputTarget.focus()
      this.scrollToBottom()
      this.clearNotification()
    }
  }

  // Force opens modal
  open() {
    this.modalTarget.classList.remove("hidden")
    this.inputTarget.focus()
    this.scrollToBottom()
    this.clearNotification()
  }

  // Hides modal
  close(event) {
    if (event) event.preventDefault()
    this.modalTarget.classList.add("hidden")
  }

  // Message Handling
  // Handles form submission for new messages
  async send(event) {
    // Prevents default form submission (page reload)
    console.log("Send method triggered")
    event.preventDefault()

    // Gets form data and extracts the user's question
    const formData = new FormData(this.formTarget)
    const userQuestion = formData.get("question[user_question]").trim()

    console.log("User question:", userQuestion)

    // Exit if question is empty
    if (!userQuestion) {
      console.log("Empty question, returning")
      return
    }

    // Clear input immediately
    this.inputTarget.value = ""

    // Add user message to UI immediately (optimistic update)
    console.log("Adding optimistic update for user message")
    const userMessageId = `user-${Date.now()}`
    this.addMessage(userQuestion, "user", userMessageId)

    console.log("Adding AI thinking placeholder")
    const thinkingMessageId = `thinking-${Date.now()}`
    this.addMessage("Thinking...", "ai", thinkingMessageId)

    // error handling
    try {
      const csrfToken = document.querySelector("meta[name='csrf-token']")?.content
      if (!csrfToken) {
        throw new Error("CSRF token not found")
      }

      console.log("Sending request to /questions")
      const response = await fetch("/questions", {
        // http method
        method: "POST",
        headers: {
          // Tells server we're sending JSON
          "Content-Type": "application/json",
          // JSON response
          "Accept": "application/json",
          // Rails security token
          "X-CSRF-Token": csrfToken
        },
        body: JSON.stringify({
          question: { user_question: userQuestion },
          format: "json"
        })
      })

      // Parses JSON response body
      console.log("Response status:", response.status)
      const data = await response.json()
      console.log("Response data:", data)
      // Add AI response to UI from JSON response if request is successfull
      if (response.ok && data.success) {
        console.log("✅ Question saved, starting polling...")
        console.log("Question ID:", data.question.id)
        // Start polling for AI response
        this.startPolling(data.question.id, thinkingMessageId)
    } else {
      console.log("Error from server:", data.errors)
      this.removeMessage(thinkingMessageId)
      this.showError(data.errors || ["Failed to send message"])
    }
      // Catches network errors (no internet, server down)
    } catch (error) {
      console.error("Chat error:", error)
      // Remove optimistic update if failed
      this.removeMessage(thinkingMessageId)
      this.showError("Network error. Please try again.")
    }
  }

  // Add this new method for polling AI answers
  // Method to start polling for AI answer
  startPolling(questionId, placeholderId) {
    console.log(`🔄 Starting polling for question ${questionId}`)

    // Clear any existing polling
    if (this.pollInterval) {
      clearInterval(this.pollInterval)
    }

    let attempts = 0
    const maxAttempts = 60 // 60 seconds max

    const poll = async () => {
      attempts++
      console.log(`📡 Polling attempt ${attempts} for question ${questionId}`)

      // Update placeholder text with loading dots
      this.updatePlaceholderText(placeholderId, attempts)

      try {
        // Try the status endpoint first
        const response = await fetch(`/questions/${questionId}/status.json`)

        if (!response.ok) {
          // If status endpoint doesn't exist, try show endpoint
          if (response.status === 404) {
            console.log("Status endpoint 404, trying show endpoint...")
            return
          }
          throw new Error(`HTTP ${response.status}`)
        }

        const data = await response.json()
        console.log("Status response:", data)

        if (data.completed && data.ai_answer && data.ai_answer !== "Still processing...") {
          console.log("✅ AI answer ready via status endpoint")
          this.replacePlaceholderWithAnswer(placeholderId, data.ai_answer)
          clearInterval(this.pollInterval)
          this.pollInterval = null
        } else if (attempts >= maxAttempts) {
          console.log("⏰ Polling timeout")
          this.replacePlaceholderWithAnswer(placeholderId, "Sorry, AI is taking too long to respond.")
          clearInterval(this.pollInterval)
          this.pollInterval = null
        }
      } catch (error) {
        console.error("Polling error:", error)

        // On error, try the show endpoint as fallback


        if (attempts >= maxAttempts) {
          this.replacePlaceholderWithAnswer(placeholderId, "Error getting response. Please try again.")
          clearInterval(this.pollInterval)
          this.pollInterval = null
        }
      }
    }

    // Start polling immediately, then every 2 seconds
    poll()
    this.pollInterval = setInterval(poll, 2000)
  }


  // Update placeholder text with loading animation
  updatePlaceholderText(placeholderId, attemptNumber) {
    const placeholder = this.messagesTarget.querySelector(`[data-message-id="${placeholderId}"]`)
    if (placeholder) {
      const bubble = placeholder.querySelector('.message-bubble')
      if (bubble) {
        const dots = '.'.repeat((attemptNumber % 3) + 1)
        bubble.textContent = `Thinking${dots}`

        // Update timestamp for the placeholder
        const timeElement = placeholder.querySelector('.message-time')
        if (timeElement) {
          timeElement.textContent = new Date().toLocaleTimeString([], {
            hour: '2-digit',
            minute: '2-digit'
          })
        }
      }
    }
  }

  // Replace placeholder with actual AI answer
  replacePlaceholderWithAnswer(placeholderId, aiAnswer) {
    const placeholder = this.messagesTarget.querySelector(`[data-message-id="${placeholderId}"]`)
    if (placeholder) {
      const bubble = placeholder.querySelector('.message-bubble')
      if (bubble) {
        bubble.textContent = aiAnswer

        // Update timestamp
        const timeElement = placeholder.querySelector('.message-time')
        if (timeElement) {
          timeElement.textContent = new Date().toLocaleTimeString([], {
            hour: '2-digit',
            minute: '2-digit'
          })
        }

        // Update the message ID to indicate it's no longer a placeholder
        placeholder.dataset.messageId = `ai-${Date.now()}`
      }
    }
  }

  // Fetches existing questions from server & Clears current messages container
  async loadQuestions() {
    console.log("Loading questions from /questions.json")
    try {
      const response = await fetch("/questions.json")
      console.log("Questions response status:", response.status)

      if (!response.ok) {
        console.error(`❌ Server error: ${response.status} ${response.statusText}`)
        return
      }

      const data = await response.json()
      console.log("Questions data received:", data)
      console.log("Number of questions:", data.questions?.length)

      this.messagesTarget.innerHTML = ""

      if (data.questions && data.questions.length > 0) {
        // Loops through questions array
        data.questions.forEach((question, i) => {
          console.log(`Processing question ${i}:`, question)
          // Adds user question and AI response as separate messages
          if (question.user_question) {
            this.addMessage(question.user_question, "user")
          }
          if (question.ai_answer) {
            this.addMessage(question.ai_answer, "ai",  `ai-${question.id}`)
          }
        })
      } else {
        console.log("No questions found")
        this.addMessage("No previous conversations found. Start a new chat!", "system")
      }
    } catch (error) {
      console.error("Failed to load questions:", error)
    }
  }

  // Creates message element and appends to messages container
  addMessage(content, role, messageId = null) {
    const messageElement = this.createMessageElement(content, role, messageId)
    this.messagesTarget.appendChild(messageElement)
    // Scrolls to show new message
    this.scrollToBottom()

    // Show notification if modal is closed and it's an AI response
    if (this.modalTarget.classList.contains("hidden") && role === "ai") {
      this.showNotification()
    }
  }

  // method to create message DOM elements
  createMessageElement(content, role, customMessageId = null) {
    const messageDiv = document.createElement("div")
    messageDiv.className = `message ${role}`
    messageDiv.dataset.role = role

    // Use custom message ID if provided, otherwise generate one
    const messageId = customMessageId || `msg-${Date.now()}`
    messageDiv.dataset.messageId = messageId

    const bubble = document.createElement("div")
    bubble.className = "message-bubble"
    bubble.textContent = content

    const time = document.createElement("div")
    time.className = "message-time"
    time.textContent = new Date().toLocaleTimeString([], {
      hour: '2-digit',
      minute: '2-digit'
    })

    messageDiv.appendChild(bubble)
    messageDiv.appendChild(time)

    return messageDiv
  }

 // Remove a specific message by ID
  removeMessage(messageId) {
    const message = this.messagesTarget.querySelector(`[data-message-id="${messageId}"]`)
    if (message) {
      message.remove()
    }
  }

  // Handle Turbo Stream updates
  handleTurboStream(event) {
    const stream = event.detail.newStream

    if (stream.target === "questions" || stream.target === "modal-questions") {
      // When a new question is added via Turbo Stream
      // We need to check if it's for the current user and update modal

      if (stream.action === "append" || stream.action === "update") {
        // Scroll to bottom when new content arrives
        setTimeout(() => this.scrollToBottom(), 100)

        // Show notification if modal is closed
        if (this.modalTarget.classList.contains("hidden")) {
          // Shows notification badge and increments badge count
          this.showNotification()
        }
      }
    }
  }

  // Clear chat history
  async clearHistory() {
    // // Ask for confirmation
    if (!confirm("Clear all chat history?")) return

    try {
      // Send DELETE request to /questions/clear
      const response = await fetch("/questions/clear", {
        method: "DELETE",
        headers: {
          "X-CSRF-Token": document.querySelector("[name='csrf-token']").content
        }
      })

      if (response.ok) {
        // Clear the messages display
        this.messagesTarget.innerHTML = ""
        // Show success message
        this.addMessage("Chat history cleared successfully", "system")
      } else {
        alert("Failed to clear history: " + ( "Unknown error"))

      }
    } catch (error) {
      console.error("Failed to clear history:", error)
    }
  }

  // Scrolls messages container to show latest message
  scrollToBottom() {
    this.messagesTarget.scrollTop = this.messagesTarget.scrollHeight
  }

  showNotification() {
    this.notificationTarget.classList.remove("hidden")
    const current = parseInt(this.notificationTarget.textContent) || 0
    this.notificationTarget.textContent = current + 1
  }

  clearNotification() {
    this.notificationTarget.classList.add("hidden")
    this.notificationTarget.textContent = "1"
  }

  // Creates error message element
  showError(message) {
    const errorDiv = document.createElement("div")
    errorDiv.className = "message error"
    errorDiv.textContent = Array.isArray(message) ? message.join(", ") : message
    this.messagesTarget.appendChild(errorDiv)
    this.scrollToBottom()
  }

  // prevent modal from closing when clicking inside it
  stopPropagation(event) {
    event.stopPropagation()
  }
}
