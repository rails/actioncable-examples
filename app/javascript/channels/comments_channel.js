import consumer from "channels/consumer"

consumer.subscriptions.create("CommentsChannel", {
  collection() { 
    return document.querySelector('[data-channel="comments"]');
  },

  connected() {
    // FIXME: While we wait for cable subscriptions to always be finalized before sending messages
    return setTimeout(() => {
      this.followCurrentMessage();
    }, 500);
  },

  disconnected() {
  },

  received(data) {
    if (!this.userIsCurrentUser(data.user_id)) { return this.collection().innerHTML += data.comment; }
  },

  userIsCurrentUser(userId) {
    return userId === document.querySelector('meta[name=current-user]').getAttribute('id');
  },

  followCurrentMessage() {
    let messageId;
    if (messageId = this.collection().dataset.messageId) {
      return this.perform('follow', { message_id: messageId });
    } else {
      return this.perform('unfollow');
    }
  },

  //follow: function() {
  //  return this.perform('follow');
  //},

  //unfollow: function() {
  //  return this.perform('unfollow');
  //}
});
