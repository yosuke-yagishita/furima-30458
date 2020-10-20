class PurchaseBuyerInfo
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :address_line, :building_name, :phone_num

  validates :city, :address_line
  validates :prefecture_id, numericality: { other_than: 1, message: 'Select' }

  POSTAL_CODE_REGEX = /\A[0-9]{3}-[0-9]{4}\z/.freeze
  PHONE_NUM_RWGEX = /\A[0-9]{,11}\z/
  with_options presense: true do
    validates :postal_code, format: {with: POSTAL_CODE_REGEX, message: "is invalid. Include hyphen(-)"}
    validates :phone_num, format: {with: PHONE_NUM_RWGEX, message: "Input only number"}
  end

  def save
    purhase = Purchase.create(user_id: user.id, item_id: item.id)
    BuyerInfo.create(postal_code: postal_code, prefecture_id:, prefecture_id, city:, city, address_line: address_line, building_name: building_name, phone_num: phone_num, item_id: item.id )
end