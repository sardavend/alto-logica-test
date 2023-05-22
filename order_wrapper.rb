require 'bigdecimal'
require_relative 'order_line'
require_relative 'product'
require_relative 'tax'

module OrderWrapper
  def parse_order_line(input_match)
    quantity =  input_match[1].to_i
    product_name = input_match[2]
    unit_price = BigDecimal(input_match[3])

    product = Product.new(
      name: product_name,
      price: unit_price
    )

    OrderLine.new(
      quantity: quantity,
      product: product,
      tax: Tax.new(product: product)
    )
  end

  module_function :parse_order_line
end
