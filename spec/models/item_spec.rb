require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品登録がうまくいくとき' do
      it '全ての項目を正しく入力すれば登録できること' do
        expect(@item).to be_valid
      end
      it 'priceの範囲が¥300~¥9,999,999以内ならば登録できること' do
        @item.price = 300
        expect(@item).to be_valid
      end
      it 'priceが半角数字ならば保存できること' do
        @item.price = 9_999_999
        expect(@item).to be_valid
      end
    end

    context '商品登録ができないとき' do
      it 'imageがないと登録できないこと' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'titleが無いと登録できないこと' do
        @item.title = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Title can't be blank")
      end
      it 'explanationが無いと登録できないこと' do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end
      it 'category_idが空だと登録できないこと' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'category_idが1だと登録できないこと' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category Select')
      end
      it 'condition_idが空だと登録できないこと' do
        @item.condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it 'condition_idが1だと登録できないこと' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Condition Select')
      end
      it 'delivery_type_idが空だと登録できないこと' do
        @item.delivery_type_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery type can't be blank")
      end
      it 'delivery_type_idが1だと登録できないこと' do
        @item.delivery_type_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery type Select')
      end
      it 'prefecture_idが空だと登録できないこと' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'prefecture_idが1だと登録できないこと' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture Select')
      end
      it 'delivery_day_idが空だと登録できないこと' do
        @item.delivery_day_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery day can't be blank")
      end
      it 'delivery_day_idが1だと登録できないこと' do
        @item.delivery_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery day Select')
      end
      it 'priceが無いと登録できないこと' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceの範囲が¥300より少ないと登録できないこと' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Out of setting range')
      end
      it 'priceの範囲が¥9,999,999より多いと登録できないこと' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Out of setting range')
      end
      it 'priceが全角数字では登録できないこと' do
        @item.price = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Out of setting range')
      end
      it 'priceが全角漢数字では登録できないこと' do
        @item.price = '三百'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Out of setting range')
      end
    end
  end
end
