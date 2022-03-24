class Address < ApplicationRecord
  belongs_to :order

  validates :post_code, presence: true, format: { with: ^(?=./^[0-9]+$/)(/^\d{3}-\d{4}$/).*$ }
  validates :city, presence: true
  validates :address_line, presence: true
  validates :address_building
  validates :phone_number, presence: true, format: { with: ^(?=./^[0-9]+$/)(?=./^0\d{9,10}$/).*$ }

  validates :delivery_area_id, numericality: { other_than: 1, message: "can't be blank" }
end