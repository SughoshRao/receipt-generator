# frozen_string_literal: true

require 'spec_helper'
require_relative '../bin/sales_tax_calculator'

describe '#call' do
  it 'calculates tax for a product' do
    result = SalesTaxCalculator.call(product: 'Thing', base_price: 5)
    expect(result.sales_tax).to eq 0.5
  end

  it 'calculates tax for an imported product' do
    result = SalesTaxCalculator.call(product: 'Imported Thing', base_price: 1)
    expect(result.sales_tax).to eq 0.15
  end

  it 'calculates tax for a book' do
    result = SalesTaxCalculator.call(product: 'Book', base_price: 1)
    expect(result.sales_tax).to eq 0.0
  end

  it 'calculates tax for an imported book' do
    result = SalesTaxCalculator.call(product: 'Imported Book', base_price: 1)
    expect(result.sales_tax).to eq 0.05
  end

  it 'calculates tax for food' do
    result = SalesTaxCalculator.call(product: 'Chocolate', base_price: 1)
    expect(result.sales_tax).to eq 0.0
  end

  it 'calculates tax for imported food' do
    result = SalesTaxCalculator.call(product: 'Imported Chocolate', base_price: 1)
    expect(result.sales_tax).to eq 0.05
  end

  it 'calculates tax for medicine' do
    result = SalesTaxCalculator.call(product: 'Red pill', base_price: 1)
    expect(result.sales_tax).to eq 0.0
  end

  it 'calculates tax for medicine' do
    result = SalesTaxCalculator.call(product: 'Imported Blue pill', base_price: 1)
    expect(result.sales_tax).to eq 0.05
  end
end
