FactoryBot.define do
  factory :user_judge do
    postal_number   {Randwordjp.zip}
    prefecture_id   {2}
    municipality    {Randwordjp.address}
    address         {"なし4-4-4"}
    building_name   {"虚構バベル塔"}
    phone_number    {1234567890}
    user_judge      {1}
  end
end
