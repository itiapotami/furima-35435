class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :item_get
  before_action :match_user, only: [:index, :create]
  def index
    @purchase_address = PurchaseAddress.new
    
  end

  def create
    @purchase_address = PurchaseAddress.new(purchase_params)
    
    if @purchase_address.valid?
      pay_item
      @purchase_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  
  def purchase_params
    params.require(:purchase_address).permit(:postal_code, :prefecture_id, :city, :house_number, :phone_number, :building_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end
  def item_get
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: purchase_params[:token],
        currency: 'jpy'
      )
  end
  def match_user
    if current_user.id == @item.user.id || @item.purchase.present?
      redirect_to root_path
    end
  end

end
