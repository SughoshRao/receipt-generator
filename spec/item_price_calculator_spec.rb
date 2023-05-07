# frozen_string_literal: true

require 'spec_helper'
require_relative '../bin/item_price_calculator'

describe '#call' do
  let(:data) { { 'Quantity' => '3', 'Product' => 'Thing', 'Price' => '5' } }

  it 'calculates total tax for a product' do
    result = ItemPriceCalculator.call(data:)
    expect(result.total_sales_tax).to eq 1.5
  end

  it 'calculates total price for a product' do
    result = ItemPriceCalculator.call(data:)
    expect(result.total_price).to eq 16.5
  end
end
