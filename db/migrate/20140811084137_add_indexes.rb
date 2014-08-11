class AddIndexes < ActiveRecord::Migration
  def change
  	add_index :goals, :team_id
  	add_index :goals, :opponent_id
  	add_index :goals, :competition_id
  	add_index :goals, :free_kick
  	add_index :goals, :scored_with
  end
end
