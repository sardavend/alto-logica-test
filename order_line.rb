require 'bigdecimal'

class OrderLine

  attr_reader :quantity, :product, :final_price, :taxes

  def initialize(product:, quantity: 0, tax:)
    @product = product
    @quantity = quantity
    @taxes = tax.taxes
    @final_price = get_final_price
  end

  private

  def get_final_price
    (product.price + taxes) * quantity
  end
end
