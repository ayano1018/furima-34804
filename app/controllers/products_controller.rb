class ProductsController < ApplicationController
  before_action :authenticate_user!, only: :create 

  def index
   
  end

  def new
    @product = Product.new
    #@product.product_images.new
  end

  def create
    @product = Product.new(product_params)
    # @product.user = current_user
    if @product.save
      redirect_to root_path
    else
      @product.errors.full_messages
      render :new
    end
  end




  private
  def product_params
  params.require(:product).permit(
    :name, :image, :description, :category_id, :condition_id, :region_id, :shipping_cost_id, :shipping_day_id, :price
  ).merge(user_id: current_user.id)
  end
end
