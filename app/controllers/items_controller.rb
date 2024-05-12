class ItemsController < ApplicationController
  before_action :move_to_index, only: [:new]
  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_paramus)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  def item_paramus
    params.require(:item).permit(:image, :title, :text, :category_id, :condition_id, :shipping_id, :region_id, :schedule_date_id, :price).merge(user_id: current_user.id)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end
end
