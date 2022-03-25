class OrdersController < ApplicationController
  
  def index
    @order_address = OrderAddress.new
    @item = Item.find(params[:item_id])
  end

  def create
    @order = Order.find(params[:id])
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      item_pay
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

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: order_params[:price],
      card: order_params[:token],
      currency:'jpy'
    )
    end
end