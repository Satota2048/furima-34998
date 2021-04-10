class ItemsController < ApplicationController
  def index
  end

  private

  #ActiveRecord不安
  def message_params
    params.require(:message).permit(:image).merge(user_id: current_user.id)
  end

end
