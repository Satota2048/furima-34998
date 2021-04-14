class CreateUserJudges < ActiveRecord::Migration[6.0]
  def change
    create_table :user_judges do |t|

      t.timestamps
    end
  end
end
