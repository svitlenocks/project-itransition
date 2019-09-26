App.comment_chat = App.cable.subscriptions.create("CommentChatChannel", {
  connected: function() {
    console.log("Connected to the comment_chat channel.");  
  },
  disconnected: function() {
    console.log("Disconnected from the comment_chat channel.");  

    },
  received: function(data) {
    var comments = $('#comment_pane');
    comments.append(data['comment']);
    $('#comments_count').html($('.comment').length);
  }
});