class Order
  include ActiveModel::Model
  attr_accessor :user_id,:items_id,:postal_code,:purefecture,:municipality,:address,:building_name,:phone_number,:user_judge

  # ここにバリデーションの処理を書く
  with_options presence: true do
    validates :postal_number, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture, numericality: {other_than: 0, message: "can't be blank"}
    validates :municipality,:address,:user_judge,:user_id,:items_id,
    validates :phone_number, numericality: {only_integer: true ,message: "半角数字のみ有効です"}
  end

  def save
    Order.create(user_id: user_id,)
    Address.create(postal_code: postal_code,)
    # 各テーブルにデータを保存する処理を書く
  end
end