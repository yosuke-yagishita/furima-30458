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
            :delivery_type, :delivery_day, :prefecture,
            :user, :image, 
            presence: true

  validates :category_id, :condition_id, :delivery_type_id,
            :delivery_day_id, :prefecture_id,
            numericality: { other_than: 1, message: 'Select' }

  validates :price,
    presence: true,
    numericality: { greater_than_or_equal_to: 300,
                    less_than_or_equal_to: 9999999,
                    message: 'Out of setting range',
                  }

end
