class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name
      t.boolean :national
      t.boolean :club

      t.timestamps
    end
  end
end