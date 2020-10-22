class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: :create
  before_action :set_item, only: [:index, :create]
  def index
    redirect_to root_path if @item.purchase.present? || (current_user.id == @item.user_id)
    @purchase_buyer_info = PurchaseBuyerInfo.new
  end

  def create
    @purchase_buyer_info = PurchaseBuyerInfo.new(purchase_params)
    if @purchase_buyer_info.valid?
      pay_item
      @purchase_buyer_info.save
      redirect_to root_path
    else
      render  'purchases/index'
    end
  end

  private

  def purchase_params
    params.require(:purchase_buyer_info).permit(:postal_code, :prefecture_id, :city, :address_line, :building_name, :phone_num).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']  # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: @item.price, # 商品の値段
      card: purchase_params[:token], # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end
