class Item < ApplicationRecord
  belongs_to :user
  has_one_attaced :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :item_category
end