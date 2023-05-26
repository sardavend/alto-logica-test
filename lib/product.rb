require 'taxable'

# Main product
class Product
  attr_reader :name, :price, :category, :imported

  include Taxable

  def initialize(name:, price:, category:, imported:)
    @name = name
    @price = price
    @category = category
    @imported = imported
  end

  def imported?
    imported
  end

  def book?
    category == 'book'
  end

  def food?
    category == 'food'
  end

  def medical_product?
    category == 'medical'
  end
end
