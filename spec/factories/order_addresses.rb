FactoryBot.define do
  factory :order_address do
    post_code                 {"123-4567"}
    region_id                 {12}
    city                      {"立川市"}
    address_number            {"町1-23-4"}
    building_name             {"渋谷1"}
    phone_number              {"09012345678"}
    # association :product_id
    # association :user_id
    
  end
end
