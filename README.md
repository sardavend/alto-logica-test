# Update

Hi there, thanks for your feedback. I have refactored the code to apply some best practices that I think make sense in the context of this assignment. I have also added more tests and replaced the Tax class with the Taxable module, which acts as a role.

Please take a look at the updated code and let me know if you have any further suggestions or questions

# Sales Receipt Generator

This is the solution for the receipt sales generator Altologica assignment

## Solution Approach

The solution is implemented in Ruby, and the input is fed into the solution using standard input. The program reads each line of input, parses the information for each item, and calculates the tax and final price for each item. The total cost and total sales tax are also calculated and displayed on the receipt.

## Requirements

The only requirement to run this program is Ruby 3.1+


## Usage

To run this program you need to pass an input file with a list of items that represent an Order
Ex:
```
cat samples/input2.txt | ruby main.rb
```

The format of the file must follow the format:

```
[quantity] [product name] at [price]
[quantity] [product name] at [price]
```

Check the *samples* directory to check the examples


## Testing

The program includes base test cases.

To run all tests:

```
ruby spec/run_tests.rb
```

To run a specific test:

```
ruby spec/name_of_the_Test.rb
```
