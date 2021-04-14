class CreateSendAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :send_addresses do |t|

      t.timestamps
    end
  end
end
