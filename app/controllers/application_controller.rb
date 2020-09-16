class ApplicationController < ActionController::Base

    before_action :authenticate_user!

    layout :layout_by_resource

    private 
    
    def layout_by_resource
        if devise_controller? #Comprueba si el controlador utilizado es device 
            "devise" #Cargara el layout device.html.erb
        else
            "application" #SINO cargara el de application.html.erb
        end 
    end

end
