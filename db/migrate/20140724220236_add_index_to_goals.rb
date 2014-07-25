class AddIndexToGoals < ActiveRecord::Migration
  def change
    add_index :goals, :player
    add_index :goals, :opponent
    add_index :goals, :team
    add_index :goals, :competition
    add_index :goals, :gfy
    add_index :goals, :assist
    add_index :goals, :own_goal
    add_index :goals, :penalty
    add_index :goals, :date
  end
end
