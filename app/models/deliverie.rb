class Deliverie < ApplicationRecord
  belongs_to :customer
  
  validatable :name, presence: true
  validatable :address, presence: true
  validatable :postal_code, presence: true

  def full_address
    "〒" + self.postal_code + " "+ self.address + " " + self.name
  end
end
