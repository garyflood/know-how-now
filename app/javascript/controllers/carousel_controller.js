import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="carousel"
export default class extends Controller {
  static values = { duration: { type: Number, default: 50000 } }

  connect() {
    this.rafId = null
    this.resumeTimeout = null
    this.manualScroll = false
    this.boundStop = this.stopAutoScroll.bind(this)
    this.boundResume = this.resumeAutoScroll.bind(this)
    this.boundWheel = this.onWheel.bind(this)

    this.element.addEventListener("wheel", this.boundWheel, { passive: true })
    this.element.addEventListener("touchstart", this.boundStop, { passive: true })
    this.element.addEventListener("touchend", this.boundResume, { passive: true })
    this.element.addEventListener("mousedown", this.boundStop)
    document.addEventListener("mouseup", this.boundResume)

    this.scroll()
  }

  disconnect() {
    this.stopAutoScroll()
    if (this.resumeTimeout != null) clearTimeout(this.resumeTimeout)
    this.element.removeEventListener("wheel", this.boundWheel)
    this.element.removeEventListener("touchstart", this.boundStop)
    this.element.removeEventListener("touchend", this.boundResume)
    this.element.removeEventListener("mousedown", this.boundStop)
    document.removeEventListener("mouseup", this.boundResume)
  }

  onWheel() {
    this.stopAutoScroll()
    if (this.resumeTimeout != null) clearTimeout(this.resumeTimeout)
    this.resumeTimeout = setTimeout(() => {
      this.resumeTimeout = null
      this.resumeAutoScroll()
    }, 0)
  }

  stopAutoScroll() {
    this.manualScroll = true
    if (this.rafId != null) {
      cancelAnimationFrame(this.rafId)
      this.rafId = null
    }
  }

  resumeAutoScroll() {
    this.manualScroll = false
    this.scroll()
  }

  scroll() {
    const el = this.element
    if (!el) return

    const maxLeft = Math.max(0, el.scrollWidth - el.clientWidth)
    if (maxLeft <= 0) return

    const duration = this.hasDurationValue ? this.durationValue : 50000
    const startLeft = el.scrollLeft
    const startTime = performance.now()

    const step = (now) => {
      if (this.manualScroll) return
      const elapsed = now - startTime
      const t = Math.min(elapsed / duration, 1)
      el.scrollLeft = startLeft + (maxLeft - startLeft) * t
      if (t < 1) this.rafId = requestAnimationFrame(step)
    }
    this.rafId = requestAnimationFrame(step)
  }
}
