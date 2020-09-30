class HomeController < ApplicationController
  def index
    @profile = current_user.profile

    if @profile.nil?
      @profile = nil?
    end
  end
end
