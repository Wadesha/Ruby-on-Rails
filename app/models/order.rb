class Order < ApplicationRecord
  belongs_to :customer
  belongs_to :product

  validates :quantity, presence: true, numericality: { greater_than: 0 }
  validates :total_price, presence: true, numericality: { greater_than: 0 }
  validates :status, presence: true
  validates :order_date, presence: true
end
