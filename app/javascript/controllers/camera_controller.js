import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [
    "video",
    "canvas",
    "permissionPrompt",
    "cameraSection",
    "capturedImageInput",
    "deniedMessage",
    "hint",
    "captureBtn",
    "bottomBar",
    "scanLine"
  ]

  async connect() {
    await this.requestCamera()
  }

  disconnect() {
    this.stopStream()
    clearInterval(this.loadingInterval)
  }

  async requestCamera(event) {
    try {
      const stream = await navigator.mediaDevices.getUserMedia({ video: { facingMode: "environment" } })
      this.stream = stream
      this.videoTarget.srcObject = stream
      this.permissionPromptTarget.classList.add("d-none")
      this.cameraSectionTarget.classList.remove("d-none")
    } catch {
      this.permissionPromptTarget.classList.remove("d-none")
      this.cameraSectionTarget.classList.add("d-none")
      if (event) {
        this.deniedMessageTarget.classList.remove("d-none")
      }
    }
  }

  capture() {
    const canvas = this.canvasTarget
    const video = this.videoTarget
    canvas.width = video.videoWidth
    canvas.height = video.videoHeight
    canvas.getContext("2d").drawImage(video, 0, 0)

    this.capturedImageInputTarget.value = canvas.toDataURL("image/jpeg", 0.85)
    this.stopStream()
    this.startLoading(true)

    this.element.querySelector("form").requestSubmit()
  }

  submitForm() {
    this.stopStream()
    this.startLoading(false)
    this.element.querySelector("form").requestSubmit()
  }

  uploadAndSubmit() {
    this.stopStream()
    this.startLoading(false)
    this.element.querySelector("form").requestSubmit()
  }

  startLoading(showFrozenFrame) {
    // Show frozen camera frame instead of black video
    if (showFrozenFrame) {
      this.canvasTarget.classList.remove("d-none")
    }

    // Animate hint: "Analysing." → "Analysing.." → "Analysing..."
    if (this.hasHintTarget) {
      let dots = 1
      this.hintTarget.textContent = "Analysing."
      this.loadingInterval = setInterval(() => {
        dots = (dots % 3) + 1
        this.hintTarget.textContent = "Analysing" + ".".repeat(dots)
      }, 500)
    }
  }

  stopStream() {
    if (this.stream) {
      this.stream.getTracks().forEach(track => track.stop())
    }
  }
}
