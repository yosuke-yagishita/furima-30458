class BuyerInfo < ApplicationRecord
  belongs_to :purchase
  belongsto_active_hash :prefecture
end
