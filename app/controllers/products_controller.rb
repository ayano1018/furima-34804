class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update ]
  before_action :set_product, only:[:show, :edit, :update]
  before_action :move_to_index, expect:[:index, :show]

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
  end

  def edit
    if current_user.id == @product.user_id 
      render :edit
    else
      redirect_to root_path
    end
  end

  def update
   end
  end




  private
  def product_params
  params.require(:product).permit(
    :name, :image, :description, :category_id, :condition_id, :region_id, :shipping_cost_id, :shipping_day_id, :price
  ).merge(user_id: current_user.id)
  end

  def set_product
    @product = Product.find(params[:id])
  end

  def move_to_index
    redirect_to root_path if current_user.id != @product.user_id
  end

end
