class ItemsController < ApplicationController

  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_paramus)
    if @item.save
      redirect_to '/'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  def item_paramus
    params.require(:item).permit(:image, :title, :text, :category_id, :condition_id, :shipping_id, :region_id, :schedule_date_id, :price_id, :fee, :profit).merge(user_id: current_user.id)
  end
end
