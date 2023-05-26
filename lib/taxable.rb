# Holds all tax role behavior
module Taxable
  BASE_TAX = 0.1
  IMPORTED_TAX = 0.05
  NEAREST_MULTIPLIER = 20

  def taxes
    calculate_taxes(all_taxes)
  end

  def all_taxes
    all_taxes = apply_base_taxes? ? BASE_TAX : 0
    all_taxes + (apply_imported_taxes? ? IMPORTED_TAX : 0)
  end

  def apply_imported_taxes?
    imported?
  end

  def apply_base_taxes?
    true unless book? || food? || medical_product?
  end

  def calculate_taxes(all_taxes)
    round_to_nearest_multiple((price * all_taxes).round(2))
  end

  def round_to_nearest_multiple(price)
    (price * NEAREST_MULTIPLIER).ceil / NEAREST_MULTIPLIER.to_f
  end
end
