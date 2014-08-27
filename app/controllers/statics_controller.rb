class StaticsController < ApplicationController
  before_action :admin_user, only: [:upload, :check] 

  def index
    @user = current_user
    if params[:query].present?
      @goals = Goal.search(params[:query])
    else
      @goals = Goal.paginate(page: params[:page], :per_page => 24)
    end
  end
  
  def about
  end
  
  def contact
  end
  
  def dmca
  end
  
  def upload
    @users = User.all.order(:id)
  end

  def check
    @teams = Team.all.order(:name)
    @goals = Team.find(125).goals_scored
  end

  private
  
    # prevent non-admin from uploading goals
    def admin_user
      redirect_to(new_goal_path) unless current_user.admin?
    end
  
end
