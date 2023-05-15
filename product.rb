class Product
  attr_reader :name, :price, :imported

  def initialize(name:, price:)
    @name = name
    @price = price
  end

  def apply_base_taxes?
    true unless is_book? || is_food? || medical_product?
  end

  def apply_imported_taxes?
    imported?
  end

  private

  def imported?
    name.include?('imported')
  end

  def is_book?
    name.include?('book')
  end

  def is_food?
    %w{chocolate snack food}.any? do |food|
      name.include?(food)
    end
  end

  def medical_product?
    %w{headache pills pain tylenol}.any? do |medical_product|
      name.include?(medical_product)
    end
  end
end
