import consumer from 'channels/consumer';

const messageId = document.querySelector('#comments').dataset.messageId;

consumer.subscriptions.create({ channel: 'CommentsChannel', message_id: messageId }, {
  appendComment(comment) {
    this.comments.insertAdjacentHTML('beforeend', comment); 
  },

  get comments() {
    return document.querySelector('[data-channel="comments"]');
  },

  received(data) {
    if (!this.userIsCurrentUser(data.user_id)) {
      this.appendComment(data.comment); 
    }
  },

  userIsCurrentUser(userId) {
    return userId === parseInt(document.querySelector('meta[name=current-user]').getAttribute('id'));
  }
});
