class PurchasesController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @purchase_buyer_info = PurchaseBuyerInfo.new
  end
  def create
    @purchase_buyer_info = PurchaseBuyerInfo.new(purchase_params)
    if @purchase_buyer_info.valid?
      @purchase_buyer_info.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render  'purchases/index'
    end
  end

  private

  def purchase_params
    params.require(:purchase_buyer_info).permit(:postal_code, :prefecture_id, :city, :address_line, :building_name, :phone_num).merge(user_id: current_user.id, item_id: params[:item_id])
  end

end
