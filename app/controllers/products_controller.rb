class ProductsController < ApplicationController
  before_action :authenticate_user!

  def index
    @products = Product.all
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




  private
  def product_params
  params.require(:product).permit(
    :user, :image, :category, :item_condition, :region, :shipping_cost, :shipping_day,
  ).merge(user_id: current_user.id)
  end
end
