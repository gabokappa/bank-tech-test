# Bank tech test

This is my proposed solution to the Bank tech test which is run in the command-line and it allows the user to carry out basic banking functionality.

## Table of contents
* [Installation](#installation-and-usage)
* [Original Instructions](#original-instructions-below)

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
*@balance; @activity; @overdraft* |
 **deposit;** |
 **withdraw;** |
 **print_statement;** |
 **add_activity;** |
 
 I decided to have one Account class, that would instantiate with the  ``@balance`` ``@activity`` and ``@overdraft``*attributes*.
 And create a series of methods ``deposit`` ``withdraw`` and ``print_statment`` that would carry out the three key requirements in the user stories.
 In addition, I would create a ``add_activity`` method that would add an event (a deposit or withdraw) to the ``@activity`` array in a formatted way.
 
 **deposit** |
 --- |
 *args* *ammount* |
 
 
 

- Why i separated the tests out
- Why i tested private method
- Private method so big. Alternative solutions




## ORIGINAL INSTRUCTIONS BELOW

# Bank tech test

Today, you'll practice doing a tech test.

For most tech tests, you'll essentially have unlimited time.  This practice session is about producing the best code you can when there is a minimal time pressure.

You'll get to practice your OO design and TDD skills.

You'll work alone, and you'll also review your own code so you can practice reflecting on and improving your own work.

## Specification

### Requirements

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
