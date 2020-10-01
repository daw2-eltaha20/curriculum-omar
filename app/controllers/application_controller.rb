class ApplicationController < ActionController::Base
   
    before_action :authenticate_user!
    before_action :find_cart
    layout :layout_by_resource

    private 
    
    def layout_by_resource
        if devise_controller? #Comprueba si el controlador utilizado es device 
            "devise" #Cargara el layout device.html.erb
        else
            "application" #SINO cargara el de application.html.erb
        end 
    end

    def find_cart #Funcion que se encarga de encontrar el carrito
        session[:cart] ||= Cart.new #Con esto comprobamos si existe la sesion, si existe devuelve el contenido y sino crea un nuevo objeto carrito
      end
end
