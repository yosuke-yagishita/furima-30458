require 'rails_helper'

RSpec.describe PurchaseBuyerInfo, type: :model do
  describe '購入情報の保存' do
    before do
      @purchase_buyer_info = FactoryBot.build(:purchase_buyer_info)
    end

    context '購入情報が登録できるとき' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@purchase_buyer_info).to be_valid
      end
      it 'building_nameが空でも保存できること' do
        @purchase_buyer_info.building_name = ''
        expect(@purchase_buyer_info).to be_valid
      end
      it 'phone_numが１１桁以下なら保存ができること' do
        @purchase_buyer_info.phone_num = '0123456789'
        expect(@purchase_buyer_info).to be_valid
      end
    end

    context '購入情報が登録できないとき' do
      it 'トークンが空では登録ができないこと' do
        @purchase_buyer_info.token = ''
        @purchase_buyer_info.valid?
        expect(@purchase_buyer_info.errors.full_messages).to include("Token can't be blank")
      end
      it 'postal_codeが空だと保存ができないこと' do
        @purchase_buyer_info.postal_code = ''
        @purchase_buyer_info.valid?
        expect(@purchase_buyer_info.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeに(-)が含まれていないと保存ができないこと' do
        @purchase_buyer_info.postal_code = '1234567'
        @purchase_buyer_info.valid?
        expect(@purchase_buyer_info.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end
      it 'prefecture_idが選択されていないと保存ができないこと' do
        @purchase_buyer_info.prefecture_id = ''
        @purchase_buyer_info.valid?
        expect(@purchase_buyer_info.errors.full_messages).to include('Prefecture Select')
      end
      it 'prefecture_idが１では保存ができないこと' do
        @purchase_buyer_info.prefecture_id = 1
        @purchase_buyer_info.valid?
        expect(@purchase_buyer_info.errors.full_messages).to include('Prefecture Select')
      end
      it 'cityが空だと保存ができないこと' do
        @purchase_buyer_info.city = ''
        @purchase_buyer_info.valid?
        expect(@purchase_buyer_info.errors.full_messages).to include("City can't be blank")
      end
      it 'address_lineが空だと保存ができないこと' do
        @purchase_buyer_info.address_line = ''
        @purchase_buyer_info.valid?
        expect(@purchase_buyer_info.errors.full_messages).to include("Address line can't be blank")
      end
      it 'phone_numが空だと保存ができないこと' do
        @purchase_buyer_info.phone_num = ''
        @purchase_buyer_info.valid?
        expect(@purchase_buyer_info.errors.full_messages).to include("Phone num can't be blank")
      end
      it 'phone_numが11桁以上だと保存ができないこと' do
        @purchase_buyer_info.phone_num = '012345678901'
        @purchase_buyer_info.valid?
        expect(@purchase_buyer_info.errors.full_messages).to include('Phone num Input only number')
      end
      it 'phone_numが半角数字以外だと保存ができないこと' do
        @purchase_buyer_info.phone_num = '０９０１２３４５６７８'
        @purchase_buyer_info.valid?
        expect(@purchase_buyer_info.errors.full_messages).to include('Phone num Input only number')
      end
    end
  end
end
