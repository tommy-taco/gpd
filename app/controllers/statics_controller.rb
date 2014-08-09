class StaticsController < ApplicationController
  before_action :admin_user, only: [:upload] 

  def index
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
  end

  private
  
    # prevent non-admin from uploading goals
    def admin_user
      redirect_to(new_goal_path) unless current_user.admin?
    end
  
end
