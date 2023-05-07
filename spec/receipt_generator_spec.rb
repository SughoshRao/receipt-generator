# frozen_string_literal: true

require 'spec_helper'
require_relative '../bin/receipt_generator'

describe '#call' do
  it 'prints the output to stdout' do
    expect { ReceiptGenerator.call('./inputs/input1.csv') }.not_to raise_error
  end

  it 'displays the correct total amount' do
    expect { ReceiptGenerator.call('./inputs/input1.csv') }.to output(match(/Total amount: 29.83/)).to_stdout
  end

  it 'displays the correct total sales tax' do
    expect { ReceiptGenerator.call('./inputs/input1.csv') }.to output(match(/Sales tax: 1.50/)).to_stdout
  end
end
