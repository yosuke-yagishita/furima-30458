class Item < ApplicationRecord
  belongs_to :user
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :delivery_type
  belongs_to_active_hash :delivery_day
  belongs_to_active_hash :prefecture
  has_one_attached :image

  validates :title, presence: true
  validates :explanation, presence: true
  validates :category_id, presence: true
  validates :condition_id, presence: true
  validates :delivery_type_id, presence: true
  validates :delivery_day_id, presence: true
  validates :prefecture_id, presence: true
  validates :price, presence: true
  validates :user, presence: true
  validates :image, presence: true

end
