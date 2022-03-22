class Item < ApplicationRecord
  belongs_to :user
  has_one_attaced :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :item_category
  belongs_to :item_status
  belongs_to :delivery_burden
  belongs_to :delivery_area
  belongs_to :delivery_day
end