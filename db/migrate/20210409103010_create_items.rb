class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string     :title,           null: false
      t.text       :explain,         null: false
      t.integer    :category_id,     null: false
      t.integer    :status_id,       null: false
      t.integer    :how_much,        null: false
      t.integer    :delivery_fee_id, null: false
      t.integer    :send_from_id,    null: false
      t.integer    :cost_day_id,     null: false
      t.references :user,            null: false, foreign_key: true
      t.timestamps
    end
  end
end
