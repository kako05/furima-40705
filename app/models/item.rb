class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, :condition, :shipping, :region, :schedule_date

  with_options presence: true do
    validates :title, :text, :price, :user,
    validates :category_id, :condition_id, :shipping_id, :region_id, :schedule_date_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :price, format: { with: /\A\d+\z/, message: "half-width numbers only" }, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is invalid"}
end
