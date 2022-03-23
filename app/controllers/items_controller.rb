class ItemsController < ApplicationController
  def index
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

  private

  def item_params
    params.require(:item).permit(:name, :description, :price, :image, :item_category_id, :item_status_id, :delivery_burden_id,
                                 :delivery_area_id, :delivery_day_id).merge(user_id: current_user.id)
  end
end
