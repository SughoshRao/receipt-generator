# frozen_string_literal: true

require_relative 'csv_reader'
require_relative 'item_price_calculator'

# Generates a receipt for a given input csv
class ReceiptGenerator
  attr_reader :csv_reader, :item_price_calculator, :sales_tax_amount, :total_amount

  def self.call(input_csv_file)
    new.call(input_csv_file:)
  end

  def initialize(csv_reader: CsvReader, item_price_calculator: ItemPriceCalculator)
    @csv_reader            = csv_reader
    @item_price_calculator = item_price_calculator
    @sales_tax_amount      = 0
    @total_amount          = 0
  end

  def call(input_csv_file:)
    input_data = csv_reader.call(file: input_csv_file)

    input_data.each do |row|
      item = item_price_calculator.call(data: row)

      puts "#{row['Quantity']}, #{row['Product']}, #{format('%.2f', item.total_price)}"

      @sales_tax_amount += item.total_sales_tax
      @total_amount     += item.total_price
    end

    puts "\nSales tax: #{format('%.2f', @sales_tax_amount)}"
    puts "Total amount: #{format('%.2f', @total_amount)}"
  rescue StandardError
    raise 'Error generating receipt'
  end
end
