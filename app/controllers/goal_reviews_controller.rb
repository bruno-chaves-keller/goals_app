class GoalReviewsController < ApplicationController

  def create
    goal = current_user.goals.find(params[:goal_id])
    review = goal.goal_reviews.new(review_params)

    if review.save
      render json: review, status: :created
    else
      render json: review.errors, status: :unprocessable_entity
    end
  end

  private

  def review_params
    params.require(:goal_review).permit(:progress, :review_date)
  end

end

