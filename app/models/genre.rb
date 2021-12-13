class Genre < ApplicationRecord
  has_many :product, dependent: :destroy
  
  validatable :name, presence: true, uniqueness: true
end
