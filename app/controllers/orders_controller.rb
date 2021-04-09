class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_product, only:[:index, :create]
  before_action :move_to_index, only:[:index,:create]

  def index
    @order_address = OrderAddress.new
    
  end


  

  def create
    @order_address = OrderAddress.new(order_params)
    
    if @order_address.valid?
       pay_product
       @order_address.save
       redirect_to root_path
       else
       render :index
    end
  end


  private

  def order_params
    params.require(:order_address).permit(:post_code, :region_id, :city, :address_number, :building_name, :phone_number).merge(product_id: params[:product_id], user_id: current_user.id, token: params[:token])
  end

  def pay_product
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] 
    Payjp::Charge.create(
      amount: @product.price,  
      card: order_params[:token],    
      currency: 'jpy'                 
    )
  end
  def set_product
    @product = Product.find(params[:product_id])
  end

  def move_to_index
    redirect_to root_path if current_user.id == @product.user_id || @product.order.present? 
  end 

  
  
end
