# frozen_string_literal: true

require_relative 'sales_tax_calculator'

# Generates a line item
class ItemPriceCalculator
  attr_reader :calculator, :total_sales_tax, :total_price

  def self.call(data:)
    new.call(data:)
  end

  def initialize(calculator: SalesTaxCalculator)
    @calculator = calculator
  end

  def call(data:)
    product_sales_tax   = calculator.call(product: data['Product'], base_price: data['Price']).sales_tax
    product_total_price = calculate_product_total_price(data['Price'], product_sales_tax)

    @total_sales_tax = product_sales_tax * data['Quantity'].to_i
    @total_price     = product_total_price * data['Quantity'].to_i

    self
  rescue StandardError
    raise 'Error generating line item'
  end

  private

  def calculate_product_total_price(price, sales_tax)
    total_price = sales_tax.positive? ? price.to_f + sales_tax : price.to_f
    total_price.round(2)
  end
end
