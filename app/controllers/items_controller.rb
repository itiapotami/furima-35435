class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]

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
    item_get
  end

  def edit
    item_get
    if current_user.id != @item.user_id

      redirect_to root_path
    end
  end

  def update
    item_get
    if current_user.id == @item.user_id
      item.update(item_params)
      if item.save
        redirect_to root_path
      else
        render :edit 
      end
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
end
