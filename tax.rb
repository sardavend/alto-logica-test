class Tax
  attr_reader :product, :taxes
  # As ruby > 2.3 multiplying a BigDecimal with any other type of number
  # it always returns a BigDecimal while maintaining the precision
  BASE_TAX_RATE = 0.1
  IMPORTED_TAX_RATE = 0.05
  NEAREST_MULTIPLIER = 20

  def initialize(product:)
    @product = product
    @taxes = apply
  end

  private

  def apply
    all_taxes = 0
    all_taxes += apply_base_taxes? ? base_taxes : 0
    all_taxes += apply_imported_taxes? ? imported_taxes : 0
  end

  def apply_imported_taxes?
    product.imported?
  end

  def apply_base_taxes?
    true unless product.is_book? || product.is_food? || product.medical_product?
  end

  def imported_taxes
    round_to_nearest_multiple((product.price * IMPORTED_TAX_RATE).round(2))
  end

  def base_taxes
    round_to_nearest_multiple((product.price * BASE_TAX_RATE).round(2))
  end

  def round_to_nearest_multiple(price)
    (price * NEAREST_MULTIPLIER).ceil / NEAREST_MULTIPLIER.to_f
  end
end
