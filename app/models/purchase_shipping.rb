class PurchaseShipping
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture, :city, :address, :building_name, :phone_number, :purchase_id, :user_id, :item_id,
                :token

  with_options presence: true do
    validates :token
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Enter it as follows (e.g. 123-4567)' }
    validates :prefecture, numericality: { other_than: 1, message: "can't be blank" }
    validates :city
    validates :address
    validates :phone_number, numericality: { only_integer: true, message: 'is invalid. Input only number' },
                             length: { minimum: 10, message: 'is too short' }
    validates :user_id
    validates :item_id
  end

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Shipping.create(postal_code: postal_code, prefecture: prefecture, city: city, address: address, building_name: building_name,
                    phone_number: phone_number, purchase_id: purchase.id)
  end
end