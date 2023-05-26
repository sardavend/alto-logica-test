require_relative 'load_path'
require 'order_items_wrapper'
require 'order'

if $stdin.stat.size.empty?
  warn('Send the Order items using the pipe | operator, Ex:  `cat input2.txt | ruby main.rb`')
else
  order_items = $stdin.map { |line| OrderItemsWrapper.parse_order_item(line) }
  order = Order.new(order_items:)
  order.generate_receipt
end
