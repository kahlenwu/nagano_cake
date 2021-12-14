class Deliverie < ApplicationRecord
  belongs_to :customer
  
  validates :name, presence: true
  validates :address, presence: true
  validates :postal_code, presence: true

  def full_address
    "〒" + self.postal_code + " "+ self.address + " " + self.name
  end
end
