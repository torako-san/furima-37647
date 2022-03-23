class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :item_category
  belongs_to :item_status
  belongs_to :delivery_burden
  belongs_to :delivery_area
  belongs_to :delivery_day

  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true, format: { with: /^[0-9]+$/, message: "は半角数値で入力して下さい" }, numericality: { length: { in: 300..9999999 }, message: "は¥300~¥9,999,999の範囲で入力して下さい" }
  validates :image, presence: true
  validates :item_category_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :item_status_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :delivery_burden_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :delivery_area_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :delivery_day_id, numericality: { other_than: 1, message: "can't be blank" }
end