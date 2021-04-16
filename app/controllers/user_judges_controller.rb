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
    if current_user.id == @item.user_id
      redirect_to root_path
    end
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # 自身のPAY.JPテスト秘密鍵を記述しましょう
      Payjp::Charge.create(
        amount: set_params.how_much,  # 商品の値段
        card: order_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
  end
end
