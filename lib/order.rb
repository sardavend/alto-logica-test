# Main object, process each order_item object to obtain the required totals
class Order
  attr_reader :order_items, :total_taxes, :total_price

  def initialize(order_items: [])
    @order_items = order_items
    @total_price, @total_taxes = process_totals
  end

  def generate_receipt
    $stdout.puts 'Receipt:'
    receipt = order_items.map do |order_line|
      "#{order_line.quantity} #{order_line.product.name}: #{format('%.2f', order_line.price_with_taxes)}"
    end
    receipt.push("Sales Taxes: #{format('%.2f', total_taxes)}")
    receipt.push("Total: #{format('%.2f', total_price)}")

    $stdout.puts receipt
  end

  private

  def process_totals
    order_items.each_with_object([0, 0]) do |order_item, totals|
      totals[0] += order_item.price_with_taxes
      totals[1] += order_item.taxes
    end
  end
end
