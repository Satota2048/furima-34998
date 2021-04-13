class ItemsController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_params, only: [:show, :edit, :update, :destroy]
  before_action :check, only: [:edit, :update, :destroy]

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
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:image, :title, :explain, :category_id, :status_id, :cost_day_id, :delivery_fee_id, :send_from_id, :cost_day_id, :how_much, :user).merge(user_id: current_user.id)
  end

  def set_params
    @item = Item.find(params[:id])
  end

  def check
    if current_user.id != @item.user_id
      redirect_to root_path
    end
  end

end
