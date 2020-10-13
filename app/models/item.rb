class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :delivery_type
  belongs_to_active_hash :delivery_day
  belongs_to_active_hash :prefecture
 
  validates :title, :explanation, :category, :condition,
            :delivery_type, :delivery_day, :prefecture, :price,
            :user, :image, 
            presence: true

  validates :category, :condition,:delivery_type,
            :delivery_day, :prefecture,
            numericality: { other_than: 1 }
            
end
