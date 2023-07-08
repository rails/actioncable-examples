import consumer from 'channels/consumer';

const comments = document.querySelector('[data-channel="comments"]');
const messageId = comments.dataset.messageId;

consumer.subscriptions.create({ channel: 'CommentsChannel', message_id: messageId }, {
  appendComment(comment) {
    comments.insertAdjacentHTML('beforeend', comment); 
  },

  received(data) {
    this.appendComment(data.comment); 
  },

  userIsCurrentUser(userId) {
    return userId === document.querySelector('meta[name=current-user]').getAttribute('id');
  }
});
