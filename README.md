# receipt-generator

## Setup

Please ensure your local environment has Ruby 3.1.4 installed

1. Clone repo 

2. Run `bundle`
```
$ cd receipt-generator
$ bundle
```

3. Run specs
```
$ rspec
```

4. Run script with one of the provided input csv files, or use your own. If you're using your own, please ensure the csv follows the same structure as the ones in the inputs folder.
```
$ ruby -r ./bin/receipt_generator.rb -e "ReceiptGenerator.call 'inputs/input4.csv'"
```
