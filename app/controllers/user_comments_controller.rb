class UserCommentsController < ApplicationController

  def create
    @review = Review.find_by id: params[:review_id]
    @comment = Comment.new(comment_params)
    @comment.review_id = params[:review_id].to_i
    @comment.account_id = params[:account_id].to_i
    if @comment.save
      # respond_to do |format|
      #   format.js
      # end
      redirect_to review_path(params[:review_id])
    else
      flash[:info] = t("fails")
      redirect_to review_path(params[:review_id])
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
