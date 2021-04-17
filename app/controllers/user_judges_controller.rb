class UserJudgesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_params, only: [:index,:create]
  before_action :origin_params, only: [:index]
  before_action :customer_check

  def index
  end

  def create
    @order = Order.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def order_params
    params.require(:order).permit(:postal_number,:prefecture_id,:municipality,:address,:building_name,:phone_number).merge(user_id: current_user.id,token: params[:token],item_id: params[:item_id])
  end

  def set_params
    @item = Item.find(params[:item_id])
  end

  def origin_params
    @order = Order.new
  end

  def customer_check
    if current_user.id == @item.user_id || @item.user_judge.present?
      redirect_to root_path
    end
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] 
      Payjp::Charge.create(
        amount: set_params.how_much,
        card: order_params[:token],
        currency: 'jpy'
      )
  end
end
