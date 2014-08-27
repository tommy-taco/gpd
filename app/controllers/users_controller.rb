class UsersController < ApplicationController
  def show
  	@user = User.find(params[:id])
  	@goals = @user.goals.paginate(page: params[:page], :per_page => 24)
  end
end
