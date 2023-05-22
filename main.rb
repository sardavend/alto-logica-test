require_relative 'order_wrapper'
require_relative 'order'

puts "Enter a list of products with their respective cost. Type `summary` if you want to generate a receipt."
ORDER_PATTERN = /^(\d+) (.+) at (\d+\.\d{2})$/
Orders = {}

order_lines = []

while line = gets
  match = ORDER_PATTERN.match(line.chomp)
  if match
    order_line = OrderWrapper.parse_order_line(match)
    order_lines.push(order_line)
  end

  break if line.chomp === 'summary'
end

order = Order.new(order_lines: order_lines)

order.generate_receipt
