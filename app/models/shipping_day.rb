class Shipping_day < ActiveHash::Base
  self.data = [
      {id: 1, status: "1〜2日で発送"},
      {id: 2, status: "2〜3日で発送"},
      {id: 3, status: "4〜7日で発送"},
      
  ]
  include ActiveHash::Associations
  has_many :product
  end