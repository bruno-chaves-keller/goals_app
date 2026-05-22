require "test_helper"

class GoalReviewsControllerTest < ActionDispatch::IntegrationTest
  test "GET index returns reviews for the current user's goal" do
    get goal_goal_reviews_url(goals(:one))

    assert_response :success

    reviews = JSON.parse(response.body)
    assert_equal 1, reviews.length
    assert_equal goal_reviews(:one).id, reviews.first["id"]
  end

  test "GET index orders reviews by review_date ascending" do
    goal = goals(:one)
    goal.goal_reviews.destroy_all

    goal.goal_reviews.create!(progress: "Later", review_date: "2026-03-10")
    goal.goal_reviews.create!(progress: "Earlier", review_date: "2026-01-01")

    get goal_goal_reviews_url(goal)

    assert_response :success

    dates = JSON.parse(response.body).map { |review| review["review_date"] }
    assert_equal ["2026-01-01", "2026-03-10"], dates
  end

  test "GET index returns not found for another user's goal" do
    get goal_goal_reviews_url(goals(:two))

    assert_response :not_found
  end
end
