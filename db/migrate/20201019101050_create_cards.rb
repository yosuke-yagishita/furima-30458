class CreateCards < ActiveRecord::Migration[6.0]
  def change
    create_table :cards do |t|
      t.string :customer_token, null: false
      t.references :buyer_info, null: false, foreign_key: true
      t.timestamps
    end
  end
end
