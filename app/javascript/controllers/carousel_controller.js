import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="carousel"
// Infinite horizontal marquee: duplicates inner content and scrolls with seamless wrap
export default class extends Controller {
  static values = { duration: { type: Number, default: 50000 } }

  connect() {
    this.rafId = null
    this.resumeTimeout = null
    this.lastTime = null
    this.manualScroll = false
    this.boundStop = this.stopAutoScroll.bind(this)
    this.boundResume = this.resumeAutoScroll.bind(this)
    this.boundWheel = this.onWheel.bind(this)

    const inner = this.element.querySelector(".device-carousel-inner") || this.element.firstElementChild
    if (inner && inner.scrollWidth > 0) {
      inner.innerHTML += inner.innerHTML
    }

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

    const halfWidth = el.scrollWidth / 2
    if (halfWidth <= 0) return

    const duration = this.hasDurationValue ? this.durationValue : 50000
    const speed = halfWidth / duration
    this.lastTime = performance.now()

    if (el.scrollLeft >= halfWidth) {
      el.scrollLeft = el.scrollLeft % halfWidth
    }

    const step = (now) => {
      if (this.manualScroll) return
      const dt = now - this.lastTime
      this.lastTime = now
      el.scrollLeft += speed * dt
      if (el.scrollLeft >= halfWidth) {
        el.scrollLeft -= halfWidth
      }
      this.rafId = requestAnimationFrame(step)
    }
    this.rafId = requestAnimationFrame(step)
  }
}
