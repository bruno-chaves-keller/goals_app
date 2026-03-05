class GoalsController < ApplicationController

  def index
    goals = Goal.all
    render json: goals
  end

  def create
    goal = Goal.new(goal_params)

    if goal.save
      render json: goal, status: :created
    else
      render json: goal.errors, status: :unprocessable_entity
    end
  end

  private

  def goal_params
    params.require(:goal).permit(
      :title,
      :description,
      :specific,
      :measurable,
      :relevant,
      :timeframe,
      :user_id
    )
  end

end
