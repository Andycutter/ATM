# README ATM simulator version 1.0 (20180615)

### List of content
1. Description 
2. Installation
3. Using ATM simulator
4. List of files
5. Changelog

#### **1. Description**
The ATM simulator is as the name implies is a program that simulates the basic interaction with an 
ATM. You will be able to simulate the deposit of cash to your account and the withdraw from your
account using the ATM. The simulator has the account and card combined in the account.

#### **2. Installation**
Start by typing `irb` in the terminal: `$ irb`.

Load the files:

`:001 > load 'lib/person.rb'`
`=> true`
`:002 > load 'lib/atm.rb'`
`=> true`
`:003 > load 'lib/account.rb`
`An error will show. Don't mind it`
`=> true`

#### **3. Using ATM simulator**



#### **4. List of files**

The ATM simulator consists of:
+ person.rb
+ account.rb
+ atm.rb

##### person.rb
Contains the methods to deposit cash to the account and to initialize the withdraw of cash from the
account. The various checks for the withdraw is done in atm.rb

##### account.rb
Contains the method for creating an account with a balance of 0, a 4 digit pin code and expiring 
date (mm/yy) for the card.

##### atm.rb
Initializes the atm with a total funds of 1000 credits. Contains the methods for checking if there
are sufficient funds in the ATM or the account. Checks for correct pin code and expire date on the
card/account. Prints a reciept with info on successful transaction. 

#### **5. Changelog**

##### V. 1 (20180615)
+ Add Description
+ Add Installation
+ Add Using ATM simulator
+ List of files
+ Changelog



