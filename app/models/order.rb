class Order < ApplicationRecord
  has_one :address dependent: :destroy 
  belongs_to :product 
  belongs_to :user
end
