require 'forwardable'
# Holds eachs Order's item
class OrderItem
  attr_reader :quantity, :product, :price_with_taxes

  extend Forwardable

  def_delegator :@product, :taxes

  def initialize(product:, quantity: 0)
    @product = product
    @quantity = quantity
    @price_with_taxes = final_price
  end

  private

  def final_price
    (product.price + taxes) * quantity
  end
end
