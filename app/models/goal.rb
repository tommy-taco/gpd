class Goal < ActiveRecord::Base
	validates :player, presence:true
	validates :team, presence:true
	validates :competition, presence:true
	def self.import(file)
		accessible_attributes = [ "id", "player", "minute", "team", "opponent", "date", "penalty", "own_goal", "stadium", "home", "competition", "stage", "assist", "video", "gfy", "updated_at"]
		CSV.foreach(file.path, headers: true) do |row|
			goal = find_by_id(row["id"]) || new
		    goal.attributes = row.to_hash.slice(*accessible_attributes)
		    goal.save!
	  end
	end
end