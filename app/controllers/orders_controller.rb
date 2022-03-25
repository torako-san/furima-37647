class OrdersController < ApplicationController
  
  def index
    @order_address = OrderAddress.new
    @item = Item.find(params[:item_id])
  end

  def create
    @order = Order.find(params[:id])
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def order_params
    params.require(:order_address).permit(:post_code, :delivery_area_id, :ctiy, :addresss_line, :phone_number).merge(user_id: current_user.id, item_id: @item.id )
  end
end