# frozen_string_literal: true

require 'csv'

# Reads an input csv into memory
class CsvReader
  def self.call(file:)
    CSV.read(file, headers: true)
  rescue StandardError
    raise 'Error reading csv'
  end
end
