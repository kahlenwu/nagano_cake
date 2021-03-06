class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :deliveries, dependent: :destroy
  has_many :cart_products, dependent: :destroy
  has_many :orders, dependent: :destroy

  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name_kana, presence: true, format: {with: /\A[ァ-ヶー－]+\z/, message: "は全角カタカナで入力してください" }
  validates :first_name_kana, presence: true, format: {with: /\A[ァ-ヶー－]+\z/, message: "は全角カタカナで入力してください" }
  validates :postal_code, presence: true, format: { with: /\A\d{7}\z/, message: "は7桁で入力してください" }, numericality: true
  validates :address, presence: true
  validates :phone_number, presence: true, format: { with: /\A\d{10,11}\z/, message: "は10桁または11桁で入力してください" }, numericality: true

  def full_name
    self.last_name + "" + self.first_name
  end

end
