class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, :condition, :shipping, :region, :schedule_date

  validates :title, :text, :price, :user, presence: true
  validates :category_id, :condition_id, :shipping_id, :region_id, :schedule_date_id, numericality: { other_than: 1, message: "can't be blank" }
end
