class Order
  attr_accessor :order_lines, :total_taxes, :total_price
  def initialize(order_lines:)
    @order_lines = order_lines
    @total_price = 0
    @total_taxes = 0
    process
  end

  def generate_receipt
    receipt = order_lines.map do |order_line|
      "#{order_line.quantity} #{order_line.product.name} #{order_line.final_price}"
    end
    receipt.push("Sales Taxes #{total_taxes}")
    receipt.push("Total #{total_price}")

    puts receipt
    puts receipt.join('\n')
  end

  private

  def process
    order_lines.each do |order_line|
      self.total_taxes += order_line.taxes
      self.total_price += order_line.final_price
    end
  end
end
