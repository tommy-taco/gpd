class AddCountryToCompetitions < ActiveRecord::Migration
  def change
    add_column :competitions, :country, :string
  end
end
