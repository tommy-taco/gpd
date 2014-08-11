class FixColumnName < ActiveRecord::Migration
  def change
  	add_column :users, :team_id, :integer
  	remove_column :users, :national_team
  end
end
