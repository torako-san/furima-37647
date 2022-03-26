class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :post_code, :city, :address_line, :address_building, :phone_number, :delivery_area_id, :item_id,
                :order_id, :token

  with_options presence: true do
    validates :token
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'は入力が無効です（例：123-3456)', allow_blank: true }
    validates :city
    validates :address_line
    validates :phone_number, format: { with: /\A[0-9]{11}\z/, message: 'は11桁数字をハイフンなしで登録して下さい', allow_blank: true }
    validates :user_id
    validates :item_id
  end

  validates :delivery_area_id, numericality: { other_than: 1, message: "can't be blank" }

  def save
    # 購入情報をを保存して、、変数に代入
    order = Order.create(item_id: item_id, user_id: user_id)
    # 住所情報を保存して、order変数のidを指定
    Address.create(post_code: post_code, city: city, address_line: address_line, address_building: address_building,
                   phone_number: phone_number, delivery_area_id: delivery_area_id, order_id: order.id)
  end
end
