# frozen_string_literal: true

module LikesHelper
  def liked_review
    Like.find_by(account_id: current_account.id, review_id: params[:review_id])
  end
end
