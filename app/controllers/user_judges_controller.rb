class UserJudgesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_params, only: [:index]
  before_action :origin_params, only: [:index,:new]

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
      render :new
    end
  end

  private
  def order_params
    params.require(:order).permit(:postal_code,:prefecture_id,:municipality,:address,:building_name,:phone_number,:user_judge,:user,:item).merge(user_id: current_user.id)
  end

  def set_params
    @item = Item.find(params[:item_id])
  end

  def origin_params
    @order = Order.new
  end
end
