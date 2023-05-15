require_relative '../order'
require_relative '../order_line'
require_relative '../product'
require 'test/unit'

class TestOrder < Test::Unit::TestCase
  def setup
    @product1 = Product.new(name: 'book', price: 12.49)
    @product2 = Product.new(name: 'music CD', price: 14.99)
    @product3 = Product.new(name: 'chocolate bar', price: 0.85)

    @order_lines = [
      OrderLine.new(product: @product1, quantity: 2),
      OrderLine.new(product: @product2, quantity: 1),
      OrderLine.new(product: @product3, quantity: 1)
    ]

    @order = Order.new(order_lines: @order_lines)
  end

  def test_total_taxes
    assert_equal 1.50, @order.total_taxes
  end

  def test_total_price
    assert_equal 42.32, @order.total_price
  end
end
