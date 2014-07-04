class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.string :player
      t.integer :minute
      t.string :team
      t.string :opponent
      t.date :date
      t.boolean :penalty
      t.boolean :own_goal
      t.string :stadium
      t.boolean :home
      t.string :competition
      t.string :stage
      t.string :assist
      t.string :video
      t.string :gfy

      t.timestamps
    end
  end
end
