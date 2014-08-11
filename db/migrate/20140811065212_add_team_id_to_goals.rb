class AddTeamIdToGoals < ActiveRecord::Migration
  def change
    add_column :goals, :team_id, :integer
    add_column :goals, :opponent_id, :integer
    add_column :goals, :competition_id, :integer
    add_column :goals, :free_kick, :boolean
    add_column :goals, :scored_with, :string
    remove_column :goals, :team
    remove_column :goals, :opponent
    remove_column :goals, :competition
  end
end