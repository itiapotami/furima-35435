class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit]

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
    @item = Item.find(params[:id])   
  end

  def edit
    @item = Item.find(params[:id])
    if current_user.id != @item.user_id

      redirect_to root_path
    end
  end

  def update
    item = Item.find(params[:id])
    item.update(item_params)
    if item.save
      redirect_to root_path
    else
      @item = item
      render :edit 
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :item_name, :description, :category_id, :status_id, :fee_id, :prefecture_id, :day_id,
                                 :price).merge(user_id: current_user.id)
  end
end
