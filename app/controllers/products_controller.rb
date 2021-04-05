class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create ]

  def index
    @products = Product.order("created_at DESC")
  end

  def new
    @product = Product.new 
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @product = Product.find(params[:id])
    
  end




  private
  def product_params
  params.require(:product).permit(
    :name, :image, :description, :category_id, :condition_id, :region_id, :shipping_cost_id, :shipping_day_id, :price
  ).merge(user_id: current_user.id)
  end
end
