class Genre < ApplicationRecord
  has_many :product, dependent: :destroy
  
  validates :name, presence: true, uniqueness: true
end
