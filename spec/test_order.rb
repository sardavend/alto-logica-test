require 'test/unit'
require_relative '../load_path'
require 'order'
require 'order_item'
require 'product'
require 'bigdecimal'

class TestOrder < Test::Unit::TestCase
  def setup
    @product1 = Product.new(name: 'book', price: 12.49, category: 'book', imported: false)
    @product2 = Product.new(name: 'music CD', price: 14.99, category: 'other', imported: false)
    @product3 = Product.new(name: 'chocolate bar', price: 0.85, category: 'food', imported: false)

    @order_items = [
      OrderItem.new(product: @product1, quantity: 2),
      OrderItem.new(product: @product2, quantity: 1),
      OrderItem.new(product: @product3, quantity: 1)
    ]

    @order = Order.new(order_items: @order_items)
  end

  def test_total_taxes
    assert_equal BigDecimal('1.50'), @order.total_taxes
  end

  def test_total_price
    assert_equal BigDecimal('42.32'), @order.total_price
  end
end
