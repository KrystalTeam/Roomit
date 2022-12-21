import { Controller } from 'stimulus';

export default class extends Controller {
  static targets = ['listToExpand', 'expandBtn', 'collapseBtn'];

  connect() {
  }

  expand() {
    this.listToExpandTarget.classList.replace('hidden', 'grid')
    this.expandBtnTarget.classList.replace('flex', 'hidden')
    this.collapseBtnTarget.classList.replace('hidden', 'flex')
  }

  collapse() {
    this.listToExpandTarget.classList.replace('grid', 'hidden')
    this.expandBtnTarget.classList.replace('hidden', 'flex')
    this.collapseBtnTarget.classList.replace('flex', 'hidden')
  }
}



