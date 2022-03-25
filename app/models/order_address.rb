class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :city, :address_line, :address_building, :phone_number, :delivery_area_id, :item_id, :user_id, :order_id

  with_options presence: true do
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :city
    validates :address_line
    validates :address_building
    validates :phone_number, format: { with: /\A[0-9]{11}\z/ }
    validates :token
  end

  validates :delivery_area_id, numericality: { other_than: 1, message: "can't be blank" }

  def save
    # 購入情報をを保存して、、変数に代入
    order = Order.create(item_id: item_id, user_id: user_id)
    # 住所情報を保存して、order変数のidを指定
    Address.create(post_code: post_code, ctiy: city, address_line: address_line, address_building: address_building, phone_number: phone_number, delivery_area_id: id, order_id: order.id )
  end
end