class OrderAddress
  include ActiveModel::Model
  attr_accessor :post_code, :region_id, :city, :address_number, :building_name, :phone_number,
  :product_id, :user_id, :token
  
  with_options presence: true do
    validates :post_code,     format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}  
    validates :region_id
    validates :city,          format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角文字を使用してください' } 
    validates :address_number,format: { with: /\A[ぁ-んァ-ヶ一-龥々ー0-9-]{,14}+\z/, message: '全角半角混ぜて使用してください'}     
    validates :phone_number,  format: { with: /\A\d{11}\z/, message: '11桁以下で入力してください'}
    validates :product_id  
    validates :user_id 
    validates :token 
  end

  def save
    order = Order.create(user_id: user_id, product_id: product_id)
    Address.create(post_code: post_code, region_id: region_id, city: city, address_number: address_number, building_name: building_name, phone_number: phone_number,order_id: order.id)
  end


end