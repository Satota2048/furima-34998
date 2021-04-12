class Item < ApplicationRecord

  belongs_to :user
  # has_one :user_judge

  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :delivery_fee
  belongs_to :send_from
  belongs_to :cost_day

  with_options presence: true do
    validates :image
    validates :title
    validates :explain
    validates :how_much, numericality: {only_integer: true ,message: "半角数字のみ有効です"}
    validates_inclusion_of :how_much, in: 300..9_999_999
    validates :user
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :status_id
    validates :delivery_fee_id
    validates :send_from_id
    validates :cost_day_id
  end

end
