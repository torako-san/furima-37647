class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :city, :address_line, :address_building, :phone_number, :delivery_area_id, :item_id, :user_id, :order_id

  with_options presence: true do
    validates :post_code, format: { with: ^/^\d{3}-\d{4}$/ }
    validates :city
    validates :address_line
    validates :address_building
    validates :phone_number, format: { with: /^0\d{9,10}$/ }
  end

  validates :delivery_area_id, numericality: { other_than: 1, message: "can't be blank" }

  def.save
    # 購入情報をを保存して、、変数に代入する
    order = Order.create(item_id: item_id, user_id: user_id)
  end
end