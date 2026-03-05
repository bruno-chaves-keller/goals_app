class AddSmartFieldsToGoals < ActiveRecord::Migration[7.1]
  def change
    add_column :goals, :specific, :text
    add_column :goals, :measurable, :string
    add_column :goals, :relevant, :text
    add_column :goals, :timeframe, :date
  end
end
