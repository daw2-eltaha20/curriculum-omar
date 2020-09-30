class ProfilesController < ApplicationController
  before_action :set_profile, only: [:edit, :update, :destroy]

  def index
    profile = current_user.profile

    if profile
      redirect_to action: "show", id: profile.id
    else
      redirect_to action: 'new'
    end
  end

  def show
    @profile_user = current_user.profile
  end

  def new
    @profile = Profile.new
  end

  def edit

  end

  def create
    
    current_user.profile = Profile.new(profile_params) #Se hace con current_user para no tener que meter yo mismo el user_id de profile
    @profile = current_user.profile
    
    respond_to do |format|
      if @profile.save
      format.json { head :no_content }
      format.js
      else 
        format.json { render json: @profile.errors.full_messages, status: :unprocessable_entity}
        format.js { render :new}
      end
    end
  end

  def update
    respond_to do |format|
      if @profile.update(profile_params)
      format.json { head :no_content }
      format.js

      else 
        format.json { render json: @profile.errors.full_messages, status: :unprocessable_entity}
        format.js { render :edit}
      end
    end
  end

  def destroy
    @profile.destroy
    respond_to do |format|
      format.json { head :no_content }
      format.js
    end
  end
  
  private 
  
  def set_profile
    @profile = Profile.find(params[:id])
  end

  def profile_params
    params.require(:profile).permit(:nombre, :apellido, :calle, :localidad, :codigo_postal, :telefono)
  end
end
