import consumer from 'channels/consumer';

consumer.subscriptions.create('CommentsChannel', {
  appendComment(comment) {
    this.comments().innerHTML += comment; 
  },

  comments() { 
    return document.querySelector('[data-channel="comments"]');
  },

  connected() {
    this.follow();
  },

  disconnected() {
    this.unfollow();
  },

  follow() {
    let messageId;

    if (messageId = this.comments().dataset.messageId) {
      return this.perform('follow', { message_id: messageId });
    }
  },

  received(data) {
    if (!this.userIsCurrentUser(data.user_id)) { 
      this.appendComment(data.comment); 
    }
  },

  unfollow() {
    return this.perform('unfollow');
  },

  userIsCurrentUser(userId) {
    return userId === document.querySelector('meta[name=current-user]').getAttribute('id');
  }
});
