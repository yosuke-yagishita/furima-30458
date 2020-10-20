class BuyerInfo < ApplicationRecord
  belongs_to :purchase
  has_one :card
  belongsto_active_hash :prefecture
end
