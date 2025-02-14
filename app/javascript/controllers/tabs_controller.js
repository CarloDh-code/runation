import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["tab", "content"];

  connect() {
    this.showTab(0);
  }

  selectTab(event) {
    event.preventDefault();

    const tabIndex = this.tabTargets.indexOf(event.currentTarget);
    this.showTab(tabIndex);
  }

  showTab(index) {
    this.tabTargets.forEach((tab, i) => {
      tab.classList.toggle("active", i === index);
    });

    this.contentTargets.forEach((content, i) => {
      content.classList.toggle("hidden", i !== index);
    });
  }
}
