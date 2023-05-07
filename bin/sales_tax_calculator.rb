# Calculates sales tax for a product
class SalesTaxCalculator
  BASE_TAX_RATE     = 0.1
  IMPORT_TAX_RATE   = 0.05
  EXEMPTED_PRODUCTS = %w[book chocolate pill].freeze

  attr_reader :sales_tax

  def self.call(product:, base_price:)
    new.call(product:, base_price:)
  end

  def call(product:, base_price:)
    tax_rate = 0

    tax_rate += IMPORT_TAX_RATE if product.downcase.include?('import')

    tax_rate += BASE_TAX_RATE if EXEMPTED_PRODUCTS.map { |ep| product.downcase.include?(ep) }.none?

    @sales_tax = ((base_price.to_f * tax_rate) * 20).round.to_f / 20 # round to nearest 0.05

    self
  rescue StandardError
    raise 'Error calculating sales tax'
  end
end
