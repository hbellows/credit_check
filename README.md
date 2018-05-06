# Credit Check

This is a starter repo for Credit Check, a Turing School Back End Mod 1 project described in more detail [here](http://backend.turing.io/module1/projects/credit_check).

__________________________________
### Project Description:
1. From the rightmost digit, which is the check digit, moving left, double the value of every second digit if product of this doubling operation is greater than 9 (e.g., 7 * 2 = 14), then sum the digits of the products (e.g., 10: 1 + 0 = 1, 14: 1 + 4 = 5).
2. Take the sum of all the digits
3. If and only if the total modulo 10 is equal to 0 then the number is valid
----
### Pseudocode:
1. Define credit card number
2. Find a method that splits the credit card number (hint: this is a string)
3. Convert string to array
4. Find a method that reverses the return value of the split number (array)
5. Double every other digit of the array
6. Determine if the doubled digit is greater than 9
7. For digits greater than 9, sum the digits
8. Sum the results
9. Run a method that divides the summed number by 10,
 - if the modulo = 0, then the card is valid,
 - if modulo != 0, then the card is invalid
10. Output a message indicating whether the card number is valid or invalid
 - If it is valid, print "The number is valid!"
 - If it is invalid, print "The number is invalid!"
---
### Expectations

**Ruby Syntax & Style**
- Naming follows convention (is idiomatic)
- Ruby methods used are logical and readable
- Code is indented properly
- Code does not exceed 80 characters per line

**Breaking Logic into Components**
- Code is effectively broken into methods & classes
- May break the principle of SRP

**Test-Driven Development**
- Each method is tested
- Functionality is accurately covered
- Tests implement Ruby syntax & style
- Balances unit and integration tests
- Evidence of edge cases testing
- A test RakeTask is implemented

**Functionality**
- Application meets all requirements (extension not req’d)

---
### Rake Task test file

Rake task test code taken from this website:

https://medium.com/@jaeger.rob/a-simple-ruby-rakefile-for-tests-149a7b783c52
