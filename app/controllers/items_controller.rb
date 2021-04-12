class ItemsController < ApplicationController

  def index
  end

  def new
    if authenticate_user!
      @item = Item.new
    else 
      redirect_to new_user_session_path
    end
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  

  # def edit
  #  @item
  # end

  private

  # 保存用記載
  def item_params
    params.require(:item).permit(:image, :title, :explain, :category_id, :status_id, :cost_day_id, :delivery_fee_id, :send_from_id, :cost_day_id, :how_much, :user).merge(user_id: current_user.id)
  end

end
