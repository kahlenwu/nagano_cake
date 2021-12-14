class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details, dependent: :destroy
  
  enum payment_method: {
    credit_card: 0,
    transfer: 1
  }
  
  enum status: {
    wating_for_payment: 0,
    confirmed_payment: 1,
    making: 2,
    ready_to_ship: 3,
    sent: 4
  }
  
  validates :name, presence: true
  validates :address, presence: true
  validates :postal_code, presence: true
  validates :postage, presence: true
  validates :total_price, presence: true
  validates :payment_method, presence: true
  validates :status, presence: true

def set_receiver(receiver)
  self.address = receiver.address
  self.postal_code = receiver.postal_code
  if receiver.is_a?(Customer)
    self.name = receiver.full_name.gsub("", "")
  else
    self.name = receiver.name
  end
end
end
