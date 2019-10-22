# Bank tech test

This is my proposed solution to the Bank tech test which is run in the command-line and it allows the user to carry out basic banking functionality.

## Table of contents
* [Installation](#installation-and-usage)
* [Usage](#usage)
* [Requirements](#requirements)
* [Approach](#approach)
* [Tests](#tests)

## Installation and usage

* Clone this repository in your desired directory on your local disk
```
$ git clone git@github.com:gabokappa/bank-tech-test.git
```

* Navigate to the above directory and in the command-line run ``bundle install``
* To run tests using RSpec type in the command-line in the project's root directory ``rspec``
* To run Rubocop type in the command-line ``rubocop``

### Usage

* Open the IRB in the command-line and ``require './lib/account.rb'``
* Create a new instance of an Account class ``account = Account.new``
* Deposit some funds by using ``deposit(number)`` example ``account.deposit(1000)``
* Withdraw funds using ``withdraw(number)`` example ``account.withdraw(250)``
* Print statement using ``print_statement`` example ``account.print_statement``

Here is a view of what this would look like in the command line
```
2.6.3 :001 > require './lib/account.rb'
 => true 
2.6.3 :002 > account = Account.new
 => #<Account:0x00007ff4961441b8 @balance=0, @activity=[], @overdraft=-100> 
2.6.3 :003 > account.deposit(1000)
 => ["22/10/2019 || 1000.00 || || 1000.00"] 
2.6.3 :004 > account.withdraw(250)
 => ["22/10/2019 || 1000.00 || || 1000.00", "22/10/2019 || || 250.00 || 750.00"] 
2.6.3 :005 > account.withdraw(17.54)
 => ["22/10/2019 || 1000.00 || || 1000.00", "22/10/2019 || || 250.00 || 750.00", "22/10/2019 || || 17.54 || 732.46"] 
2.6.3 :006 > account.print_statement
date || credit || debit || balance
22/10/2019 || || 17.54 || 732.46
22/10/2019 || || 250.00 || 750.00
22/10/2019 || 1000.00 || || 1000.00

```

## Requirements
### Original specifications
* You should be able to interact with your code via a REPL like IRB or the JavaScript console.  (You don't need to implement a command line interface that takes input from STDIN.)
* Deposits, withdrawal.
* Account statement (date, amount, balance) printing.
* Data can be kept in memory (it doesn't need to be stored to a database or anything).

### Acceptance criteria

**Given** a client makes a deposit of 1000 on 10-01-2012  
**And** a deposit of 2000 on 13-01-2012  
**And** a withdrawal of 500 on 14-01-2012  
**When** she prints her bank statement  
**Then** she would see

```
date || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00
13/01/2012 || 2000.00 || || 3000.00
10/01/2012 || 1000.00 || || 1000.00
```
## Approach

It has been built on Ruby for a quick turn around and to use RSpec as I was familiar with how to test what was being
printed in the standard output.
### User stories

I took the acceptance criteria of the exercise and created some user stories to guide my thinking.

``As a user I want to be able to deposit money into my account``

``As a user I would like to withdraw funds from my account``

``As a user I would like to see a statement formatted in a specific way and with a header
date || credit || debit || balance``

### Diagrams

From the user stories I broke down the requirements into a diagram

**Account** |
--- |
*@balance; @activity; @overdraft;* |
 **deposit** |
 **withdraw** |
 **print_statement** |
 **add_activity** |
 
 I decided to have one Account class, that would instantiate with the  ``@balance`` ``@activity`` and ``@overdraft``*attributes*.
 And create a series of methods ``deposit`` ``withdraw`` and ``print_statment`` that would carry out the three key requirements in the user stories.
 In addition, I would create a ``add_activity`` method that would add an event (a deposit or withdraw) to the ``@activity`` array in a formatted way.
 I felt the different requirements could be fulfilled by one object (the account) which the user calls methods on.
 
 **deposit** |
 --- |
 (*args*) *ammount* |
 @balance |
 **add_activity** | 
 
 A ``deposit`` method would take an amount as an argument. It would need to know ``@balance`` to add the amount to it and be able to pass information to ``add_activity``
 method so that the activity is recorded.
 
  **withdraw** |
  --- |
  (*args*) *ammount* |
  @balance |
  @overdraft |
  **add_activity** |   

A ``withdraw`` method would act similar to the deposit, only that it would subtract the amount from the balance.
It would need to know the ``@overdraft`` limit to throw an error if the withdraw goes over the limit.

 **print_statement** |
  --- |
  @activity |
  header variable |

``print_statement`` method needs to access the activity array as a log of the account's transactions. The method iterates
through the ``@activity`` to print out each transaction under a 'header'.

   **add_activity** |
   --- |
   (*args*) *ammount*, *event*, *date* |
   @balance |
   @activity |
 
 
 A private method that takes three arguments, and amount an event type("deposit" or "withdraw") and a date. The date
 has default to when the method is invoked. The methods needs to know ``@balance`` in order to pass the activity into the ``@activity`` log.
 This method is private as is not intended for the user to call directly and for internal operation of the ``deposit`` and ``withdraw`` methods.
 
 I have also set the date as a parameter with a default value for the purposes of giving the option to insert a specified date.
 This would only require a small change as to how the method is called. 
 
 ## Tests
 
 Tests can be run using ``rspec`` in the command-line.
 
 I decided to split test files per method being tested. I tested the private method ``spec/add_activity_spec.rb`` to ensure it was putting through
 the right formatted string into ``@activity``. I wanted to test it worked in isolation from being called by the ``deposit`` or ``withdraw`` methods.
 
## Edge case

 In order to prevent an infinite number of withdrawals and having high negative balance I added an overdraft limit.
This has a default set to -100 when the Account is instantiated. Just like real life accounts different limits can be set
on different instances of an account which the user can set upon instantiation.

## Trade-offs

I'm aware that the private method ``add_activity`` has many lines and this could be refactored further.
I tried changing ``add_activity`` so that it pushed individual transactions as a key/value hash in ``@activity``, to later get the
``print_statement`` method to format into specified string. I also thought that ``deposit`` and ``withdraw`` could format the amount
before calling ``add_activity``. I felt that these alternative implementations would lead to duplication of code further split responsibilities and affect readability.
 
 Ultimately I decided to introduce another private method and retained the current state as I believe this way it is easier to read each method and understand what function it has.