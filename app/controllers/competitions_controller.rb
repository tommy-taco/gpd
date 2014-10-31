class CompetitionsController < ApplicationController
  before_action :set_comp, only: [:show]

  def index
  	@competitions = Competition.order("name DESC").where(:id => Goal.select(:competition_id).uniq)
  end

  def show
    @goals = @competition.goals.paginate(page: params[:page], :per_page => 24)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comp
      @competition = Competition.find(params[:id])
    end
end
