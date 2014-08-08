# class Goal < ActiveRecord::Base
# 	# include Tire::Model::Search
# 	# include Tire::Model::Callbacks

# 	tire.settings :index => {
# 		:analysis => {
# 			:analyzer => {
# 			  	ascii: {
# 			      type: 'custom',
# 			      tokenizer: 'standard',
# 			      filter: ['standard','asciifolding']
# 				},
# 				:default => {
#               		:type => 'ascii'
#             	}
# 			}
# 		}
# 	}


# 	mapping do
# 	  indexes :id, type: 'integer', index: :not_analyzed
# 	  indexes :gfy, index: :not_analyzed
# 	  indexes :minute, type: 'integer', index: :not_analyzed
# 	  indexes :player, boost: 3, analyzer: :ascii
# 	  indexes :opponent, boost: 2,analyzer: :ascii
# 	  indexes :team, boost: 4, analyzer: :ascii
# 	  indexes :date, type: 'date', index: :not_analyzed
# 	  indexes :stadium, analyzer: :ascii
# 	  indexes :competition, boost: 3, analyzer: :ascii
# 	  indexes :assist, boost: 2, analyzer: :ascii
# 	  indexes :stage, boost: 2, analyzer: :ascii
# 	end
	

# 	def self.search(params)
# 	  tire.search(page: params[:page], per_page: 12) do 
# 	    query { string params[:query], analyzer: :ascii } if params[:query].present?
# 	  end
# 	end




# 	# Validations


# 	validates :player, presence:true
# 	validates :team, presence:true
# 	validates :opponent, presence:true
# 	validates :competition, presence:true

# 	# CSV Import/Export

# 	def self.to_csv(options = {})
# 	  CSV.generate(options) do |csv|
# 	    csv << column_names
# 	    all.each do |goal|
# 	      csv << goal.attributes.values_at(*column_names)
# 	   end
# 	end
#   	end


# 	def self.import(file)
# 		accessible_attributes = [ "id", "player", "minute", "team", "opponent", "date", "penalty", "own_goal", "stadium", "home", "competition", "stage", "assist", "video", "gfy", "updated_at"]
# 		CSV.foreach(file.path, headers: true) do |row|
# 			goal = find_by_id(row["id"]) || new
# 		    goal.attributes = row.to_hash.slice(*accessible_attributes)
# 		    goal.save!
# 	  end
# 	end
# end