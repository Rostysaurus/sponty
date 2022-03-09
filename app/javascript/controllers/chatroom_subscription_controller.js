import { Controller } from "@hotwired/stimulus"
import consumer from "../channels/consumer"

export default class extends Controller {
  static values = { chatroomId: Number }
  static targets = ["messages", "form", "current", "messager"]

  connect() {
    this.channel = consumer.subscriptions.create(
      { channel: "ChatroomChannel", id: this.chatroomIdValue },
      { received: message => this.#insertMessageScrollDownAndResetForm(message) }
    )
    console.log(`Subscribed to the chatroom with the id ${this.chatroomIdValue}.`)
  }

  #insertMessageScrollDownAndResetForm(message) {
    const currentUser = this.currentTarget.innerText
    console.log(currentUser);
    console.log(typeof(message));
    let newDiv = document.createElement('div')
    newDiv.innerHTML = message
    console.log(newDiv);
    console.log(typeof(newDiv));
    const messager = newDiv.querySelector("#email").innerText.trim()
    // const messager = newDiv.messagerTarget
    console.log(messager);
    if (currentUser === messager) {
      const newData = message.replace(/(?!class="message-box )(\w+)(?=">)/, "chat");
      message = newData
    } else {
      const leftData = message.replace(/(?!class="message-box )(\w+)(?=">)/, "chat chat-left");
      message = leftData
    }
    this.messagesTarget.insertAdjacentHTML("beforeend", message)
    this.messagesTarget.scrollTo(0, this.messagesTarget.scrollHeight)
    this.formTarget.reset()
  }

  disconnect() {
    console.log("Unsubscribed from the chatroom")
    this.channel.unsubscribe()
  }
}
