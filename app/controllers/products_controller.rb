class ProductsController < ApplicationController
  def index
    @products = Product.all
    
  end

  def show
    @product= Product.find(params[:id])
    add_to_cart
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def add_to_cart
    product = Product.find(params[:id]) #Busca los producto por el id seleccionado
    @cart = find_cart #LLama a la funcion find_Cart para guardar la session o para crear un nuevo objeto de cart
    
    product_index = @cart.find_index {|p| p['id'] == product.id }
    if product_index
      @cart[product_index]['count'] += 1
    else
      @cart.push({'id' => product.id, 'name' => product.name, 'manufacturer' => product.manufacturer, 'image' => product.image, 'price' => product.price, 'count' => 1})
    end
    session['cart'] = @cart
    redirect_to products_path
  end

  def display_cart
    @cart = find_cart
    @items = @cart.items
  end
  private

  def find_cart #Funcion que se encarga de encontrar el carrito
    session['cart'] ||= [] #Con esto comprobamos si existe la sesion, si existe devuelve el contenido y sino crea un nuevo objeto carrito

  end
end
