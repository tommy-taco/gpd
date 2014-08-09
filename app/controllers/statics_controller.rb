class StaticsController < ApplicationController
  def index
    @user = current_user.username
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
  
  def gtest
  end
end
