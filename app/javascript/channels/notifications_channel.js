import consumer from "./consumer"

let MyApp = {
  notificationReceived: function(data) {
    console.log(data);
  }
}

consumer.subscriptions.create("NotificationsChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
    this.typing = this.typing.bind(this);
    document.addEventListener('keyup', this.typing)
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
    MyApp.notificationReceived(data);
  },

  typing() {
    // Invoke #isTyping on notifications_channel.rb
    this.perform('typing');
  }
});
