class LikesController < ApplicationController
  include LikesHelper

  def create
    @review = Review.find_by id: params[:review_id]

    respond_to do |format|
      if liked_review.present?
        if liked_review.destroy
          format.js
        end
      else
        @like = Like.new review_id: params[:review_id]
        @like.account_id = current_account.id
        if @like.save
          format.js
        else
          flash[:info] = t("fails")
          redirect_to review_path(params[:review_id])
        end
      end
    end
  end

end

