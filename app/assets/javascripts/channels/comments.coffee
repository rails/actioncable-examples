App.comments = App.cable.subscriptions.create "CommentsChannel",
  # Called when the subscription is ready for use on the server
  connected: ->
    # FIXME: While we wait for cable subscriptions to always be finalized before sending messages
    setTimeout =>
      @followCurrentMessage()
      @installPageChangeCallback()
    , 1000

  # Called when the WebSocket connection is closed
  disconnected: ->
    # TODO hide messages

  # Called when the subscription is rejected by the server
  rejected: ->
    # TODO hide messages

  # When data is received from the server itself
  received: (data) ->
    @commentsDiv().append(data.comment) unless @userIsCurrentUser(data.comment)

  followCurrentMessage: ->
    if messageId = @commentsDiv().data('message-id')
      # corresponds to CommentsChannel#follow
      @perform 'follow', message_id: messageId
    else
      # corresponds to CommentsChannel#unfollow
      @perform 'unfollow'

  installPageChangeCallback: ->
    unless @installedPageChangeCallback
      @installedPageChangeCallback = true
      $(document).on 'page:change', -> App.comments.followCurrentMessage()

  # Helpers

  userIsCurrentUser: (comment) ->
    $(comment).attr('data-user-id') is $('meta[name=current-user]').attr('id')

  commentsDiv: -> $("[data-channel='comments']")