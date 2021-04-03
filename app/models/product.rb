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
  validates :name,             presence: true
  validates :description,      presence: true
  validates :category_id,      presence: true
  validates :condition_id,     presence: true
  validates :shipping_cost_id, presence: true
  validates :region_id,        presence: true
  validates :shipping_day_id,  presence: true
  validates :price,            presence: true,  numericality: {greater_than: 300, less_than: 10000000} 
 end


end
