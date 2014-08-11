class Team < ActiveRecord::Base

has_many :goals_scored, :class_name => 'Goal', :foreign_key => 'team_id'
has_many :goals_conceded, :class_name => 'Goal', :foreign_key => 'opponent_id'

end
