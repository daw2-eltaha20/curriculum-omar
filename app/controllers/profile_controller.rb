class ProfileController < ApplicationController
  before_action :set_profile, only: [:edit, :update, :destroy]

  def index
    @profiles = Profile.all
    @find_profile = Profile.where(user_id:current_user.id).take

    if(@find_profile == nil)
      @profile = Profile.create(inicio:"creado", nombre:"Debe contener un nombre", user_id:current_user.id, apellido: "Debe contener un apellido", calle: "Debe contener una calle", localidad: "Debe contener una localidad", codigo_postal: "Debe contener un codigo postal", telefono: "Debe contener un telefono");
    end
  end

  def show

  end

  def new
    @profile = Profile.new
  end

  def edit

  end

  def create
    @profile = Profile.new(profile_params)
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
