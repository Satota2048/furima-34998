FactoryBot.define do
  factory :order do
    postal_number   {"111-1111"}
    prefecture_id   {2}
    municipality    {"音に聞こえ市ソルマッ区"}
    address         {"なし4-4-4"}
    building_name   {"虚構バベル塔"}
    phone_number    {1234567890}
    # user_id         {3}
    # item_id         {1}
    token           {"tok_abcdefghijk00000000000000000"}
  end
end
