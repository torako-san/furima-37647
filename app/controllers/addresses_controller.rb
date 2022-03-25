class AddressesController < ApplicationController
  def create
    @address = Address.new(address_params)
    if @address.save
      redirect_to root_path
    else
      render :index
    end
  end

  def address_params
    params.require(:address).permit(:post_code, :delivery_area_id, :ctiy, :addresss_line, :phone_number).merge(order_id: params[:order.id])
  end
end
