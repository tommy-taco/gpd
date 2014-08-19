class TeamsController < ApplicationController
  before_action :set_team, only: [:show]

  def index
  	@teams = Team.where(:id => Goal.select(:team_id).uniq).paginate(page: params[:page], :per_page => 24)
  end

  def show
    @goals = @team.goals_scored.paginate(page: params[:page], :per_page => 24)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_team
      @team = Team.find(params[:id])
    end
end