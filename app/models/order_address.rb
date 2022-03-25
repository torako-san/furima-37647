class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :city, :address_line, :address_building, :phone_number, :delivery_area_id, :item_id, :user_id
end