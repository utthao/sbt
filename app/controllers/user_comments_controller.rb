# frozen_string_literal: true

class UserCommentsController < ApplicationController
  def create
    @review = Review.find_by id: params[:review_id]
    @comment = Comment.new(comment_params)
    @comment.review_id = params[:review_id].to_i
    @comment.account_id = params[:account_id].to_i
    if @comment.save
      redirect_to review_path(params[:review_id])
    else
      flash[:info] = t('fails')
      redirect_to review_path(params[:review_id])
    end
  end

  def destroy
    @review = Review.find_by id: params[:id]
    @comment = Comment.find_by id: params[:comment_id]
    if @comment.destroy
      @like = Like.new
      @review = Review.find_by id: params[:id]
      @comment_items = Comment.all.order('created_at DESC')
      @comment = Comment.new
      flash[:info] = t('deletedsuccess')
      redirect_to review_path(params[:id])
    else
      @like = Like.new
      @review = Review.find_by id: params[:id]
      @comment_items = Comment.all.order('created_at DESC')
      @comment = Comment.new
      flash[:info] = t('fails')
      redirect_to review_path(params[:id])
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
