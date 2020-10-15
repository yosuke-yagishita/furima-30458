class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :title,             null: false
      t.text :explanation,         null: false
      t.integer :category_id,      null: false
      t.integer :condition_id,     null: false
      t.integer :delivery_type_id, null: false
      t.integer :delivery_day_id,  null: false
      t.integer :prefecture_id,    null: false
      t.integer :price,            null: false
      t.references :user,          null: false
      t.timestamps
    end
  end
end
