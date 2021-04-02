class Product < ApplicationRecord
extend ActiveHash::Associations::ActiveRecordExtensions

 belongs_to :user
 has_one_attached :image
 belongs_to_active_hash :category
 belongs_to_active_hash  :item_condition
 belongs_to_active_hash  :region
 belongs_to_active_hash  :shipping_cost
 belongs_to_active_hash  :shipping_day

 validates :title, :text, presence: true
 validates :genre_id, numericality: { other_than: 1 } 


end
