class CommentBroadcastJob < ApplicationJob
  queue_as :default

  def perform(comment)
    # Do something later
    ActionCable.server.broadcast "comment_chat", {
      comment: render_comment(comment)
    }
  end

  private

  def render_comment(comment)
    CommentsController.render(
        partial: 'comment',
        locals: {
          comment: comment

        }
      )
  end

end
