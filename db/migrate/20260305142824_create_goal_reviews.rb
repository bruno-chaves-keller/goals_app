class CreateGoalReviews < ActiveRecord::Migration[7.1]
  def change
    create_table :goal_reviews do |t|
      t.references :goal, null: false, foreign_key: true
      t.text :progress
      t.date :review_date

      t.timestamps
    end
  end
end
