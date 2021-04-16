FactoryBot.define do
  factory :order do
    postal_number   {"111-1111"}
    prefecture_id   {2}
    municipality    {"音に聞こえ市ソルマッ区"}
    address         {"なし4-4-4"}
    building_name   {"虚構バベル塔"}
    phone_number    {1234567890}
    user_judge      {1}
    user_id         {3}
    items_id        {1}
  end
end
