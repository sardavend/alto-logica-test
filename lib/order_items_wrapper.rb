require 'bigdecimal'
require 'order_item'
require 'product'
require 'debug'

# Factory like module to manufacture OrderItem and Product objects
module OrderItemsWrapper
  ORDER_PATTERN = /^(\d+) (.+) at (\d+\.\d{2})$/

  module_function

  def parse_order_item(line)
    quantity, product_name, unit_price = capture_item(line)
    product = Product.new(
      name: product_name,
      price: BigDecimal(unit_price),
      category: category(product_name),
      imported: imported?(product_name)
    )
    OrderItem.new(quantity: quantity.to_i, product:)
  rescue StandardError => e
    message = <<~TEXT
      There is a problem parsing the loaded data, please make sure you are using
      the correct format, The offending line has the follwing content `#{line}`
      Error: #{e}
    TEXT
    $stderr.puts(message)
    exit(1)
  end

  def category(product_name)
    case product_name
    when /(chocolate|snack|food)/
      'food'
    when /(headache|pills|pain|tylenol)/
      'medical'
    when /(book)/
      'book'
    else
      'consumer'
    end
  end

  def imported?(product_name)
    product_name.include?('imported')
  end

  def capture_item(line)
    ORDER_PATTERN.match(line)&.captures
  end
end
