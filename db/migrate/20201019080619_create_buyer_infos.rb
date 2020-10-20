class CreateBuyerInfos < ActiveRecord::Migration[6.0]
  def change
    create_table :buyer_infos do |t|
      t.string :postal_code,      null:false
      t.integer :prefecture_id,   null:false
      t.string :city,             null:false
      t.string :address_line,     null:false
      t.string :building_name,    null:false
      t.string :phone_num,        null:false
      t.references :purchase,     null: false,  foreign_key:true
      t.timestamps
    end
  end
end
