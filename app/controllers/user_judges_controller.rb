class UserJudgesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_params, only: [:index,:create]
  before_action :origin_params, only: [:index,:new]
  before_action :customer_check

  def index
  end

  def new
  end
  
  def create
    @order = Order.new(order_params)
    if @order.valid?
      @order.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def order_params
    params.require(:order).permit(:postal_number,:prefecture_id,:municipality,:address,:building_name,:phone_number,:user_judge,:user,:item).merge(user_id: current_user.id)
  end

  def set_params
    @item = Item.find(params[:item_id])
  end

  def origin_params
    @order = Order.new
  end

  def customer_check
    if current_user.id == @item.user_id
      redirect_to root_path
    end
  end
end