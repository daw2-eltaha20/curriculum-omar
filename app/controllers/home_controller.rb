class HomeController < ApplicationController
  def index
    @find_profile = Profile.where(user_id:current_user.id).take  
  end
end
