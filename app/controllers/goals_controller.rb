class GoalsController < ApplicationController
  before_action :set_goal, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:edit, :create, :update, :new]
  before_action :admin_user, only: [:destroy, :import]

  # GET /goals
  # GET /goals.json
  def index
    @goals = Goal.search_wrapper(params)
    @query = params[:query].to_s
    @csvgoals = Goal.all
    respond_to do |format|
      format.html
      format.csv { render text: @csvgoals.to_csv }
    end
  end

  #POST import
  def import
    if params[:file].blank?
      redirect_to :back, alert: "No File Uploaded"
    else
      query = "SELECT setval('goals_id_seq', max(id))
         FROM goals"
    	Goal.import(params[:file])
      Goal.connection.execute(query)
    	redirect_to root_url, notice: "Import Worked!"
    end
  end

  # GET /goals/1
  # GET /goals/1.json
  def show
  	if @goal.gfy != nil
      @gfyid = @goal.gfy.gsub("http://gfycat.com/", "")
    end
  end

  # GET /goals/new
  def new
    @goal = Goal.new
  end

  # GET /goals/1/edit
  def edit
    if @goal.gfy != blank?
      @gfyid = @goal.gfy.gsub("http://gfycat.com/", "")
    end
  end

  # POST /goals
  # POST /goals.json
  def create
    @goal = current_user.goals.build(goal_params)

    respond_to do |format|
      if @goal.save
        format.html { redirect_to @goal, notice: 'Goal was successfully created.' }
        format.json { render :show, status: :created, location: @goal }
      else
        format.html { render :new }
        format.json { render json: @goal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /goals/1
  # PATCH/PUT /goals/1.json
  def update
    respond_to do |format|
      if @goal.update(goal_params)
        format.html { redirect_to @goal, notice: 'Goal was successfully updated.' }
        format.json { render :show, status: :ok, location: @goal }
      else
        format.html { render :edit }
        format.json { render json: @goal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /goals/1
  # DELETE /goals/1.json
  def destroy
    @goal.destroy
    respond_to do |format|
      format.html { redirect_to goals_url, notice: 'Goal was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_goal
      @goal = Goal.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def goal_params
      params.require(:goal).permit(:player, :minute, :team_id, :opponent_id, :date, :penalty, :own_goal, :stadium, :home, :competition_id, :stage, :assist, :video, :gfy, :scored_with, :free_kick, :user_id)
    end

    # prevent non-admin from deleting goals
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
