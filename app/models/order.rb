class Order
  include ActiveModel::Model
  attr_accessor :user_id,:item_id,:postal_number,:prefecture_id,:municipality,:address,:building_name,:phone_number,:user_judge_id,:token

  with_options presence: true do
    validates :token
    validates :postal_number, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: {other_than: 1, message: "can't be blank"}
    validates :municipality,:address,:user_id,:item_id
    validates :phone_number, numericality: {only_integer: true ,message: "半角数字のみ有効です"}
  end
  validates :phone_number, format: {with: /\A\d{10,11}\z/, message: "10〜11桁の半角数字のみ有効です" }

  def save
    user_judge =  UserJudge.create(user_id: user_id,item_id: item_id)
    SendAddress.create(postal_number: postal_number,prefecture_id: prefecture_id,municipality: municipality,address: address,building_name: building_name,phone_number: phone_number,user_judge_id: user_judge.id)
  end
end