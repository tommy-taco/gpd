class Goal < ActiveRecord::Base
	validates :player, presence:true
	validates :team, presence:true
	validates :competition, presence:true
end
