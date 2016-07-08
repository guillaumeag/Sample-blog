class CommentsMailer < ApplicationMailer
  def submitted(comment)
    @comment = comment

    mail to: "comments@ownerblog.com", subject: 'New comment'
  end
end
