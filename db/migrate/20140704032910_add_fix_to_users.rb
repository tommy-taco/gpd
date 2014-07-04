class AddFixToUsers < ActiveRecord::Migration
  def change
    add_column :users, :national_team, :string
  end
end
