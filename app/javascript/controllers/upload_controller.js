import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [
    "overlay",
    "progressBar",
    "progressPct",
    "progressCard",
    "successCard",
    "photoPreview",
    "videoDropzone",
    "videoIcon",
    "videoTitle",
    "videoSub"
  ]

  // ── Photo preview ──────────────────────────────────────────────────────────
  // Called when user selects device photos — shows thumbnails below dropzone
  previewPhotos(event) {
    const files = event.target.files
    if (!files || files.length === 0) return

    const preview = this.photoPreviewTarget
    preview.innerHTML = ""

    Array.from(files).forEach(function(file) {
      const url = URL.createObjectURL(file)
      const img = document.createElement("img")
      img.src = url
      img.className = "upload-photo-thumb"
      img.alt = file.name
      preview.appendChild(img)
    })

    preview.style.display = "flex"
  }

  // ── Video selected indicator ───────────────────────────────────────────────
  // Shows filename and turns dropzone teal when a video is chosen
  previewVideo(event) {
    const file = event.target.files[0]
    if (!file) return

    // Swap icon to a filled check circle
    this.videoIconTarget.innerHTML = '<i class="fa-solid fa-circle-check" style="color: white;"></i>'
    this.videoIconTarget.style.background = "#4ECDC4"

    // Show filename (trimmed if long)
    const name = file.name.length > 30 ? file.name.substring(0, 28) + "…" : file.name
    this.videoTitleTarget.textContent = name
    this.videoTitleTarget.style.color = "#1a1a2e"

    // Show file size
    const mb = (file.size / (1024 * 1024)).toFixed(1)
    this.videoSubTarget.textContent = `${mb} MB — ready to upload`
    this.videoSubTarget.style.color = "#4ECDC4"

    // Give dropzone a selected state
    this.videoDropzoneTarget.classList.add("upload-dropzone--selected")
  }

  // ── Device name check icon ─────────────────────────────────────────────────
  // Turns the check icon teal when the field has content
  updateCheck(event) {
    const check = this.element.querySelector("#deviceNameCheck")
    if (check) {
      check.style.color = event.target.value.trim().length > 0 ? "#4ECDC4" : "#ccc"
    }
  }

  // ── Form submit with XHR progress ─────────────────────────────────────────
  submit(event) {
    event.preventDefault()

    const form    = event.target           // the <form> element, not the controller div
    const formData = new FormData(form)
    const csrf    = document.querySelector('meta[name="csrf-token"]')
    const xhr     = new XMLHttpRequest()

    // Show the progress overlay
    this.overlayTarget.style.display = "flex"
    this.progressCardTarget.style.display = "flex"
    this.successCardTarget.style.display  = "none"

    // Track file transfer from browser → server
    xhr.upload.addEventListener("progress", (e) => {
      if (e.lengthComputable) {
        const pct = Math.round((e.loaded / e.total) * 100)
        this.progressBarTarget.style.width = pct + "%"
        this.progressPctTarget.textContent = pct + "%"
      }
    })

    // File fully transferred — Cloudinary processing now happens server-side
    xhr.upload.addEventListener("load", () => {
      this.progressBarTarget.style.width = "100%"
      this.progressPctTarget.textContent = "Processing..."
    })

    // Server responded — either success redirect or validation error
    xhr.addEventListener("load", () => {
      if (xhr.status >= 200 && xhr.status < 400) {
        // Show success state
        this.progressCardTarget.style.display = "none"
        this.successCardTarget.style.display  = "flex"

        // Navigate to the redirect target after a short delay
        setTimeout(() => {
          window.location.href = xhr.responseURL
        }, 1800)
      } else {
        // Validation error — reload the page so Rails re-renders with errors
        this.overlayTarget.style.display = "none"
        window.location.reload()
      }
    })

    // Network failure
    xhr.addEventListener("error", () => {
      this.overlayTarget.style.display = "none"
      alert("Upload failed due to a network error. Please try again.")
    })

    xhr.open("POST", form.action)
    if (csrf) xhr.setRequestHeader("X-CSRF-Token", csrf.content)
    xhr.send(formData)
  }
}
