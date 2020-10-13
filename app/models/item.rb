class Item < ApplicationRecord
  belongs_to :user
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :delivery_type
  belongs_to_active_hash :delivery_day
  belongs_to_active_hash :prefecture
end
