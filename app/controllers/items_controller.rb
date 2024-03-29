class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :item_get, only: [:show, :edit, :update,:destroy]
  before_action :match_user, only: [:edit, :update, :destroy]

  def index
    @items = Item.order(id: 'DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    
  end

  def edit
  end

  def update
      @item.update(item_params)
      if @item.save
        redirect_to item_path(@item)
      else
        render :edit 
      end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :item_name, :description, :category_id, :status_id, :fee_id, :prefecture_id, :day_id,
                                 :price).merge(user_id: current_user.id)
  end

  def item_get
    @item = Item.find(params[:id])
  end

  def match_user
    if current_user.id != @item.user_id || @item.purchase.present?
      redirect_to root_path
    end
  end
end
