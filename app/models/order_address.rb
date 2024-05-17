class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postcode, :region_id, :city, :house_num, :building, :phone, :token

  with_options presence: true do
    validates :user_id, :item_id, :city, :house_num, :phone, :postcode, :token
  end
  validates :postcode, format: { with: /\A\d{3}-\d{4}\z/, message: "input correctly" }
  validates :region_id, numericality: { other_than: 0, message: "Select" }
  validates :phone, format: { with: /\A\d{10,11}\z/, message: "is invalid" }

  def save
    order = Order.create(user_id: user_id, item_id: item_id,)
    Address.create(postcode: postcode, region_id: region_id, city: city, house_num: house_num, building: building, phone: phone, order_id: order.id )
  end
end

