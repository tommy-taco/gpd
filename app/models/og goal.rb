class Goal < ActiveRecord::Base
	include Tire::Model::Search
	include Tire::Model::Callbacks


	# analyzer

	tire.settings :index => {
      :analysis => {
	      :analyzer => {
	          :accent_analyzer => {
	              :tokenizer => "standard",
	              :filter => ["standard", "my_ascii_folding" ]
	          }
          },
          :filter => {
              :my_ascii_folding => {
                  :type => "asciifolding",
                  :preserve_original => true
              }
          }
      }
  }

	# Tire/Elastic Seach Things
	

	mapping do
	  indexes :id, type: 'integer'
	  indexes :minute, type: 'integer'
	  indexes :player, boost: 3, analyzer: 'accent_analyzer'
	  indexes :opponent, boost: 2, analyzer: 'accent_analyzer'
	  indexes :team, boost: 4, analyzer: 'accent_analyzer'
	  indexes :date, type: 'date'
	  indexes :stadium, analyzer: 'accent_analyzer'
	  indexes :competition, boost: 3, analyzer: 'accent_analyzer'
	  indexes :assist, boost: 2, analyzer: 'accent_analyzer'
	end




	def self.search(params)
	  tire.search(page: params[:page], per_page: 12) do
	    query { string params[:query], default_operator: "AND" } if params[:query].present?
	  end
	end



	# Validations


	validates :player, presence:true
	validates :team, presence:true
	validates :opponent, presence:true
	validates :competition, presence:true

	# CSV Import/Export

	def self.to_csv(options = {})
	  CSV.generate(options) do |csv|
	    csv << column_names
	    all.each do |goal|
	      csv << goal.attributes.values_at(*column_names)
	   end
	end
  	end


	def self.import(file)
		accessible_attributes = [ "id", "player", "minute", "team", "opponent", "date", "penalty", "own_goal", "stadium", "home", "competition", "stage", "assist", "video", "gfy", "updated_at"]
		CSV.foreach(file.path, headers: true) do |row|
			goal = find_by_id(row["id"]) || new
		    goal.attributes = row.to_hash.slice(*accessible_attributes)
		    goal.save!
	  end
	end
end