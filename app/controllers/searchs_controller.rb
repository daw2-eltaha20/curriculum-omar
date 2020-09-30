class SearchsController < ApplicationController
  def create
    #search = "%#{params[:keyword]}%"
    #search_fix = search.downcase
    @products = Product.where("name ILIKE ?", "%#{params[:keyword]}%")
    respond_to do |format|
      format.html { redirect_to root_path}
      format.json {render json: @products}
      format.js
    end
  end
end
