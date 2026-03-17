import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    this.#wrapSections()
    this.#markStepHeadings()
    this.#markStepLists()
    this.#positionTimelines()
    this.#observeCards()
  }

  disconnect() {
    this.#observer?.disconnect()
  }

  // 1. Wrap each h2 + following siblings into a .manual-card div
  #wrapSections() {
    const children = Array.from(this.element.children)
    let card = null
    children.forEach(el => {
      if (el.tagName === "H2") {
        card = document.createElement("div")
        card.className = "manual-card"
        this.element.insertBefore(card, el)
      }
      if (card) card.appendChild(el)
    })
  }

  // 2. Number direct-child elements that start with <strong> as step headings.
  //    Add .has-timeline to the card only when steps are found.
  #markStepHeadings() {
    this.element.querySelectorAll(".manual-card").forEach(card => {
      let step = 0
      Array.from(card.children).forEach(child => {
        if (child.tagName === "H2") return
        const first = child.firstElementChild
        if (first && first.tagName === "STRONG") {
          step++
          child.classList.add("manual-step-heading")
          child.setAttribute("data-step", step)
        }
      })
      if (step > 0) card.classList.add("has-timeline")
    })
  }

  // 3. Mark ol lists whose first li starts with bold as step-title lists
  #markStepLists() {
    this.element.querySelectorAll(".manual-card ol").forEach(ol => {
      const firstLi = ol.querySelector(":scope > li")
      if (!firstLi) return
      const firstEl = firstLi.firstElementChild
      if (firstEl && (firstEl.tagName === "STRONG" ||
          (firstEl.tagName === "P" && firstEl.firstElementChild && firstEl.firstElementChild.tagName === "STRONG"))) {
        ol.classList.add("manual-step-list")
        ol.closest(".manual-card").classList.add("has-timeline")
        let s = 0
        ol.querySelectorAll(":scope > li").forEach(li => {
          s++
          li.setAttribute("data-step", s)
        })
      }
    })
  }

  // 4. Align the vertical line to start and end at the center of the first/last circles.
  //    Uses CSS variables so the ::before pseudo-element can read them.
  #positionTimelines() {
    this.element.querySelectorAll(".manual-card.has-timeline").forEach(card => {
      const circles = card.querySelectorAll(".manual-step-heading, ol.manual-step-list > li")
      if (!circles.length) return
      const first = circles[0]
      const last = circles[circles.length - 1]
      card.style.setProperty("--timeline-top", (first.offsetTop + 17) + "px")
      const lastCircleCenter = last.offsetTop + 17
      card.style.setProperty("--timeline-bottom", (card.offsetHeight - lastCircleCenter) + "px")
    })
  }

  // 5. Fade-in each card as it scrolls into view, with a staggered delay.
  #observeCards() {
    const cards = this.element.querySelectorAll(".manual-card")

    this.#observer = new IntersectionObserver((entries) => {
      entries.forEach(entry => {
        if (!entry.isIntersecting) return
        entry.target.classList.add("is-visible")
        this.#observer.unobserve(entry.target)
      })
    }, { threshold: 0.08 })

    cards.forEach((card, i) => {
      card.style.transitionDelay = `${i * 80}ms`
      this.#observer.observe(card)
    })
  }

  #observer = null
}
