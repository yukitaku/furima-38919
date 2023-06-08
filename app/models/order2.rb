class Order2 
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :place_id, :city, :banti, :building_name, :tel, :token

  validates :user_id, presence: true
  validates :item_id, presence: true
  validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }, presence: true
  validates :place_id, numericality: { other_than: 0, message: "can't be blank" }, presence: true
  validates :city, presence: true
  validates :banti, presence: true
  validates :tel, format: { with: /\A[0-9]{11}\z/, message: 'is invalid' }, presence: true
   validates :token, presence: true


  def save
    order = Order.create(user_id: user_id, item_id: item_id)

    History.create(order_id: order.id, post_code: post_code, place_id: place_id, city: city,banti: banti, building_name: building_name,tel: tel)
  end



end

