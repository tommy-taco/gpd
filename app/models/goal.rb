class Goal < ActiveRecord::Base
	belongs_to :team, :class_name => 'Team'
	belongs_to :opponent, :class_name => 'Team'
	belongs_to :competition
	ratyrate_rateable "quality"


	nilify_blanks :only => [:assist, :stadium, :scored_with, :date, :video, :gfy]




	include Tire::Model::Search
	include Tire::Model::Callbacks

	tire.settings :index => {
      :analysis => {
          :analyzer => {
				:index_analyzer => {
				  :tokenizer => "whitespace",
				  :filter => ["asciifolding", "lowercase", "snowball"]
				},
				:search_analyzer => {
				  :tokenizer => "whitespace",
				  :filter => ["asciifolding", "lowercase", "snowball"]
				}
          }
      }
  }


		mapping do
		  indexes :id, type: 'integer', index: :not_analyzed
		  indexes :gfy, index: :not_analyzed
		  indexes :minute, type: 'integer', index: :not_analyzed
		  indexes :player, boost: 5, analyzer: :index_analyzer
		  indexes :date, type: 'date', index: :not_analyzed
		  indexes :stadium, boost: 2, analyzer: :index_analyzer
		  indexes :assist, boost: 3, analyzer: :index_analyzer
		  indexes :stage, boost: 3, analyzer: :index_analyzer
		  # see json methods below, to search associations
		  indexes :team_id, type: 'integer'
		  indexes :team_name, boost: 4, analyzer: :index_analyzer
		  indexes :opponent_id, type: 'integer'
		  indexes :opponent_name, boost: 2, analyzer: :index_analyzer
		  indexes :competition_id, type: 'integer'
		  indexes :competition_name, boost: 3, analyzer: :index_analyzer

		end
	

	def self.search(params)
	  tire.search(page: params[:page], per_page: 12, load: true) do 
	    query { string params[:query] } if params[:query].present?
	  end
	end

	def to_indexed_json
    	to_json(methods: [:team_name, :opponent_name, :competition_name])
	end

	def team_name
		team.name
	end

	def opponent_name
		opponent.name
	end

	def competition_name
		competition.name
	end


# add to fix ascii but no ascii
# , analyzer: :search_analyzer, :default_field => 'player'

	# Validations


	validates :player, presence:true
	validates :team_id, presence:true
	validates :opponent_id, presence:true
	validates :competition_id, presence:true

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
		accessible_attributes = [ "id", "player", "minute", "date", "penalty", "own_goal", "stadium", "home", "stage", "assist", "video", "gfy", "updated_at", "team_id", "opponent_id", "competition_id", "scored_with", "free_kick"]
		CSV.foreach(file.path, headers: true) do |row|
			goal = find_by_id(row["id"]) || new
		    goal.attributes = row.to_hash.slice(*accessible_attributes)
		    goal.save!
	  end
	end
end