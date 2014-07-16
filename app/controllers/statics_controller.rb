class StaticsController < ApplicationController
  def index
    @goals = Goal.all
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
