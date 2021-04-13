class ItemsController < ApplicationController

  before_action :authenticate_user!, only: :new

  def index
    @items = Item.all.order("created_at DESC")
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
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    if @item.update
      redirect_to item_path(@item.id)
    else
      render 'shared/error_messages', model: f.object
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :title, :explain, :category_id, :status_id, :cost_day_id, :delivery_fee_id, :send_from_id, :cost_day_id, :how_much, :user).merge(user_id: current_user.id)
  end

end
