class CartProduct < ApplicationRecord
  belongs_to :customer
  belongs_to :product

  validates :quantity, presence: true

  #カート内の商品合計に利用
  def sum_of_price
    product.tax_included_price * quantitu
  end
end
