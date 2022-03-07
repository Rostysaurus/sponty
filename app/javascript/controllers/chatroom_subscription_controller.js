import { Controller } from "@hotwired/stimulus"
import consumer from "../channels/consumer"

export default class extends Controller {
  static values = { chatroomId: Number }
  static targets = ["messages", "form"]

  connect() {
    this.channel = consumer.subscriptions.create(
      { channel: "ChatroomChannel", id: this.chatroomIdValue },
      { received: message => this.#insertMessageScrollDownAndResetForm(message) }
    )
    console.log(`Subscribed to the chatroom with the id ${this.chatroomIdValue}.`)
  }

  #insertMessageScrollDownAndResetForm(message) {
    this.messagesTarget.insertAdjacentHTML("beforeend", message)
    this.messagesTarget.scrollTop(0, this.messagesTarget.scrollHeight)
    this.formTarget.placeholder = "write here"
  }

  disconnect() {
    this.channel.unsubscribe()
  }
}
