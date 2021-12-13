class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :deliveries, dependent: :destroy
  has_many :cart_products, dependent: :destroy
  has_many :orders, dependent: :destroy
  
  validatable :last_name, presence: true
  validatable :first_name, presence: true
  validatable :last_name_kana, presence: true, format: {with: /\A[ァ-ヶー－]+\z/, message: "は全角カタカナで入力してください" }
  validatable :first_name_kana, presence: true, format: {with: /\A[ァ-ヶー－]+\z/, message: "は全角カタカナで入力してください" }
  validatable :postal_code, presence: true, format: { with: /\A\d{7}\z/, message: "は7桁で入力してください" }, numericality: true
  validatable :address, presence: true
  validatable :phone_number, presence: true, format: { with: /\A\d{10,11}\z/, message: "は10桁または11桁で入力してください" }, numericality: true
  
  def full_name
    self.last_name + "" + self.first_name
  end
  
end
