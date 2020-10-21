class PurchaseBuyerInfo
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :address_line, :building_name, :phone_num, :user_id, :item_id, :token

  validates :city, :address_line, :token, presence: true
  validates :prefecture_id, numericality: { other_than: 1, message: 'Select' }

  POSTAL_CODE_REGEX = /\A[0-9]{3}-[0-9]{4}\z/.freeze
  PHONE_NUM_RWGEX = /\A[0-9]{,11}\z/.freeze
  with_options presence: true do
    validates :postal_code, format: {with: POSTAL_CODE_REGEX, message: "is invalid. Include hyphen(-)"}
    validates :phone_num, format: {with: PHONE_NUM_RWGEX, message: "Input only number"}
  end

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    BuyerInfo.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address_line: address_line, building_name: building_name, phone_num: phone_num, purchase_id: purchase.id )
  end
end