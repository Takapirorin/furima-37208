class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_charge
  belongs_to :prefecture
  belongs_to :delivery
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :product_name
    validates :explanation
    validates :category_id
    validates :condition_id
    validates :shipping_charge_id
    validates :prefecture_id
    validates :delivery_id
  end

  with_options numericality: {other_than: 1 , message: "can't be blank"} do
    validates :category_id 
    validates :condition_id
    validates :shipping_charge_id
    validates :prefecture_id
    validates :delivery_id
  end

  validates :price , presence: true, numericality: { only_integer: true, message: 'is invalid. Input half-width characters' } 
  validates :price , numericality: {greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'is out of setting range'}
end
