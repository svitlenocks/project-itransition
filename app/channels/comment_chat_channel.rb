class CommentChatChannel < ApplicationCable::Channel
  def subscribed
    stream_from "comment_chat"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
