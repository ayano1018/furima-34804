FactoryBot.define do
  factory :product do
      name                   {"犬ロボット"}
      description            {"中型犬のサイズです"}
      category_id            {6}
      condition_id           {1}
      region_id              {13}
      shipping_cost_id       {1}
      shipping_day_id        {2}
      price                  {1111}
      association :user


  after(:build) do |product|
    product.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
  end
end
end
