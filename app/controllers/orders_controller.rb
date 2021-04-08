class OrdersController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @order_address = OrderAddress.new
    @product = Product.find(params[:product_id])
  end

  # def new
  #   @order_address = OrderAddress.new
  # end

  def create
    @product = Product.find(params[:product_id])
    @order_address = OrderAddress.new(order_params)
      
    if @order_address.valid?
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:post_code, :region_id, :city, :address_number, :building_name, :phone_number).merge(product_id: params[:product_id], user_id: current_user.id)
  end

  
end
