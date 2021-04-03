class Product < ApplicationRecord
belongs_to :user
has_one_attached :image
extend ActiveHash::Associations::ActiveRecordExtensions

 
 belongs_to_active_hash :category
 belongs_to_active_hash  :item_condition
 belongs_to_active_hash  :region
 belongs_to_active_hash  :shipping_cost
 belongs_to_active_hash  :shipping_day

 with_options presence: true do
  validates :name,             
  validates :description,      
  validates :category_id,      
  validates :condition_id,     
  validates :shipping_cost_id, 
  validates :region_id,        
  validates :shipping_day_id,  
  validates :price,            numericality: {greater_than: 300, less_than: 10000000} 
 end


end
