class Item < ApplicationRecord

  belongs_to :user
  # has_one :user_judge

  with_options presence: true do
    validates :title
    validates :explain
    validates :category_id
    validates :status_id
    validates :how_much
    validates :delivery_fee_id
    validates :send_from_id
    validates :cost_day_id
    validates :user
  end

end
