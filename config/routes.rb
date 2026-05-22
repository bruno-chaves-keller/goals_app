Rails.application.routes.draw do
  resources :goals do
    resources :goal_reviews, only: [:create, :index]
  end
end

