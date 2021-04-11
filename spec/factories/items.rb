FactoryBot.define do
  factory :item do
    title           {"タイトル"}
    explain         {"説明文"}
    category_id     {2}
    status_id       {2}
    delivery_fee_id {2}
    send_from_id    {2}
    cost_day_id     {2}
    how_much        {3400}
    association :user
    
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image2.png'), filename: 'test_image2.png')
    end
  end
end
