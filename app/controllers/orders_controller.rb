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
    Payjp.api_key = "sk_test_0fba9cd4b558cb32a57bfc77"  
    Payjp::Charge.create(
      amount: @product.price,  
      card: order_params[:token],    
      currency: 'jpy'                 
    )
  end

  
end
