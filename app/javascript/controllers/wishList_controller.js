import { Controller } from 'stimulus';

export default class extends Controller {
  static targets = ['wishListIcon'];

  initialize() {}
  connect() {
    if (this.element.dataset.liked === 'true') {
      this.setLikedStatus(true);
    } else {
      this.setLikedStatus(false);
    }
  }
  setLikedStatus(state) {
    if (state) {
      this.wishListIconTarget.classList.remove('text-gray-500', 'opacity-80');
      this.wishListIconTarget.classList.add('text-pink-600', 'opacity-100');
    } else {
      this.wishListIconTarget.classList.add('text-gray-500', 'opacity-80');
      this.wishListIconTarget.classList.remove('text-pink-600', 'opacity-100');
    }
  }

  wishListState(e) {
    e.preventDefault();
    const token = document.querySelector('meta[name="csrf-token"]').content;
    const id = this.element.dataset.id;
    fetch(`/rooms/${id}/wish_list`, {
      method: 'PATCH',
      headers: {
        'X-CSRF-Token': token,
        'Content-Type': 'application/json',
      },
    })
      .then((resp) => resp.json())
      .then(({ status }) => {
        if (status === 'liked') {
          this.setLikedStatus(true);
        } else {
          this.setLikedStatus(false);
        }
      })
      .catch((err) => {
        console.log('err');
      });
  }
}
