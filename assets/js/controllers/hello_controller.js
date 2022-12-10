import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "name", "output" ]


  async greet() {
    this.outputTarget.textContent = `Hello, ${this.nameTarget.value}!`
  }
// 
//   async connect() {
//     // this.outputTarget.textContent = `Hello, ${this.nameTarget.value}!`
//     
//     
//     
//     this.outputTarget.textContent = `Hello, Johannes`
//   }
}