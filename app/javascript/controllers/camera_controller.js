import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [
    "video",
    "canvas",
    "permissionPrompt",
    "cameraSection",
    "capturedImageInput"
  ]

  async connect() {
    await this.requestCamera()
  }

  disconnect() {
    this.stopStream()
  }

  async requestCamera() {
    try {
      const stream = await navigator.mediaDevices.getUserMedia({ video: { facingMode: "environment" } })
      this.stream = stream
      this.videoTarget.srcObject = stream
      this.permissionPromptTarget.classList.add("d-none")
      this.cameraSectionTarget.classList.remove("d-none")
    } catch {
      this.permissionPromptTarget.classList.remove("d-none")
      this.cameraSectionTarget.classList.add("d-none")
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

    this.element.querySelector("form").requestSubmit()
  }

  submitForm() {
    this.stopStream()
    this.element.querySelector("form").requestSubmit()
  }

  uploadAndSubmit() {
    this.stopStream()
    this.element.querySelector("form").requestSubmit()
  }

  stopStream() {
    if (this.stream) {
      this.stream.getTracks().forEach(track => track.stop())
    }
  }
}
