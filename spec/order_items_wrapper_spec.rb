require_relative '../load_path'
require 'test/unit'
require 'order_items_wrapper'
require 'bigdecimal'

class TestItemsWrapper < Test::Unit::TestCase
  def setup
    consumer_imported_input = '1 imported bottle of perfume at 27.99'
    medical_input = '1 packet of headache pills at 9.75'
    imported_food_input = '3 imported boxes of chocolates at 11.25'
    @consumer_order_item = OrderItemsWrapper.parse_order_item(consumer_imported_input)
    @medical_order_item = OrderItemsWrapper.parse_order_item(medical_input)
    @food_order_item = OrderItemsWrapper.parse_order_item(imported_food_input)

  end

  def test_consumer_item_product_attrs
    assert_equal true, @consumer_order_item.product.imported?
    assert_equal 'consumer', @consumer_order_item.product.category
  end

  def test_medical_item_product_attrs
    assert_equal false, @medical_order_item.product.imported?
    assert_equal 'medical', @medical_order_item.product.category
  end

  def test_imported_food_product_attrs
    assert_equal true, @food_order_item.product.imported?
    assert_equal 'food', @food_order_item.product.category
  end

  def test_order_item_taxes
    assert_equal BigDecimal('4.2'), @consumer_order_item.taxes
    assert_equal BigDecimal('0'), @medical_order_item.taxes
    assert_equal BigDecimal('0.6'), @food_order_item.taxes
  end

  def test_order_price_with_taxes
    assert_equal BigDecimal('32.19'), @consumer_order_item.price_with_taxes
    assert_equal BigDecimal(@medical_order_item.product.price), @medical_order_item.price_with_taxes
    assert_equal BigDecimal('35.55'), @food_order_item.price_with_taxes
  end
end
