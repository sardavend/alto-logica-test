require 'debug'
class OrderLine
  attr_accessor :quantity, :product, :final_price, :taxes

  BASE_TAX_RATE = 0.1
  IMPORTED_TAX_RATE = 0.05
  DIGIT_RATIO = 20

  def initialize(product:, quantity:)
    @product = product
    @quantity = quantity
    @taxes = 0
    @final_price = 0
    get_taxes
    get_final_price
  end

  private

  def get_taxes
    self.taxes += product.apply_base_taxes? ? base_taxes : 0
    self.taxes += product.apply_imported_taxes? ? imported_taxes : 0
    self.taxes
  end

  def get_final_price
    self.final_price = (product.price + taxes) * quantity
    self.final_price
  end

  def base_taxes
    round_to_nearest_price((product.price * BASE_TAX_RATE).round(2))
  end

  def imported_taxes
    round_to_nearest_price((product.price * IMPORTED_TAX_RATE).round(2))
  end

  def round_to_nearest_price(price)
    (price * 20).ceil / 20.0
  end
end
