## SilverBars

A Ruby program which generates a summary of buy and sell orders and displays it as described in User Stories.

### User Stories

```
As a User
I can register an order with the following details:
-  user id
-  order quantity in kg (e.g.: 3.5 kg)
-  price per kg (e.g.: £303)
-  order type: BUY or SELL.
```

```
As a User
I can see SELL orders on the board in ascending order.
```

```
As a User
I can see BUY orders on the board in descending order.
```

```
As User
I can see merged orders, where quantities of orders with the same price and type add up.

For example, Imagine we have received the following orders:

a) SELL: 3.5 kg for £306 [user1]
b) SELL: 1.2 kg for £310 [user2]
c) SELL: 1.5 kg for £307 [user3]
d) SELL: 2.0 kg for £306 [user4]

Our ‘Live Order Board’ should provide us with the following summary information:

SELL: 5.5 kg for £306 // order a + order d
SELL: 1.5 kg for £307 // order c
SELL: 1.2 kg for £310 // order b
```

```
As a User
I can cancel a registered order - this will remove the order from 'Live Order Board.'
```

### Ruby version

This project was developed using Ruby 2.5.1p57 but should run fine on other ruby versions.
If you encounter issues running the program, please update your ruby version.

To check your ruby version:

```
$ ruby -v
```

### To install dependencies:

(You might need to install Bundler first):

```
$ gem install bundler
```

Then:

```
$ bundle install
```

### To run tests:

```
$ rspec
```

### To run linting:

```
$ rubocop
```

### To run the demonstration script:

```
$ ruby main.rb
```

You can change/inspect the code in main.rb to see how it works.

![Demo](assets/demo.png)

Alternatively, you can check the specs to see working examples.

### Other considered solutions

Since the requirements stated that there is no UI needed, I have not provided solutions for edge cases where the user input would have been incorrect, ie: text instead of an integer.

Initially, I chose to pass the order data as parameters to the `LiveOrderBoard.register` method and create the `Order` instance inside the method. It didn't feel right to me that the board should create orders, so I changed my mind and decided to pass `Order` instances instead.

When planning the implementation of the program I was considering having separate classes for SELL and BUY orders. I decided that maybe this would be an overkill for such a simple requirement. I believe separate classes would be more suitable if there were more order types with different data/properties.

I considered having two summary methods, one for buy orders and another for sell orders. Since the requirements were unspecific about how to handle both summaries, I decided to keep them in the same summary, so it is easier for the business analyst to see a complete summary in one place. It would be simple to separate them if necessary.

I considered the performance of the program with the chain of array operations (reduce, sort, map...) used in the implementation. The performance could be improved by reducing loop operations, but I think that, at this stage, premature optimisation could damage code readability. To avoid premature optimisation, I believe we should measure performance over time and improve it when needed.
