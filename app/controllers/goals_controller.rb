class GoalsController < ApplicationController

  def index
    goals = current_user.goals
    render json: goals
  end

  def create
    goal = current_user.goals.new(goal_params)

    if goal.save
      render json: goal, status: :created
    else
      render json: goal.errors, status: :unprocessable_entity
    end
  end

  def update
    goal = current_user.goals.find(params[:id])

    if goal.update(goal_params)
        render json: goal
    else
        render json: goal.errors, status: :unprocessable_entity
  end
end

def destroy
  goal = current_user.goals.find(params[:id])
  goal.destroy

  head :no_content
end


  private

  def goal_params
    params.require(:goal).permit(
      :title,
      :description,
      :specific,
      :measurable,
      :relevant,
      :timeframe
    )
  end

end
