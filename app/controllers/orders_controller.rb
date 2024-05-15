class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]
  before_action :move_to_top, only: [:index, :create]

  def index
    @orderaddress = OrderAddress.new
  end

  def create
      @orderaddress = OrderAddress.new(order_params)
    if @orderaddress.valid?
      @orderaddress.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def order_params
    params.require(:order_address).permit(:postcode, :region_id, :city, :house_num, :building, :phone, :order_id).merge(user_id: current_user.id, item_id: @item.id)
  end

  def move_to_top
    if current_user == @item.user
    redirect_to items_path
    end
  end
end