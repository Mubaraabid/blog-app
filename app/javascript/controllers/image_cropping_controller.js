import { Controller } from "@hotwired/stimulus"
import Cropper from 'cropperjs'

export default class extends Controller {
  static targets = ["image", "x", "y", "width", "height"]

  imageSelected(event) {
    const file = event.target.files[0]
    if (file) {
      const reader = new FileReader()

      reader.onload = (e) => {
        this.imageTarget.src = e.target.result
        this.imageTarget.style.display = 'block'
        this.initializeCropper()
      }

      reader.readAsDataURL(file)
    }
  }

  initializeCropper() {
    if (this.cropper) {
      this.cropper.destroy()
    }

    this.cropper = new Cropper(this.imageTarget, {
      aspectRatio: 16 / 9, 
      viewMode: 2,
      crop: (event) => {
        const data = event.detail
        this.xTarget.value = Math.round(data.x)
        this.yTarget.value = Math.round(data.y)
        this.widthTarget.value = Math.round(data.width)
        this.heightTarget.value = Math.round(data.height)
      }
    })
  }
}
