module UserCommentsHelper
  def check_own_comment(id)
    @comment = Comment.find_by id: id
    return true if @comment.account_id == current_account.id || current_account.role == "admin"
  end
end
