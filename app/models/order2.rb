class Order2 
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :place_id, :city, :banti, :building_name, :tel, :token

 with_options presence: true do
  validates :user_id
  validates :item_id
  validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }, presence: true
  validates :place_id, numericality: { other_than: 0, message: "can't be blank" }
  validates :city
  validates :banti
  validates :tel, format: { with: /\A[0-9]{10,11}\z/, message: 'is invalid' }
   validates :token
  end

  def save
    history = History.create(user_id: user_id, item_id: item_id)

    Order.create(history_id: history.id, post_code: post_code, place_id: place_id, city: city,banti: banti, building_name: building_name,tel: tel)
  end



end

