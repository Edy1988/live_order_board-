## SilverBars
A small program which generates a summary of buys and sell orders and displays it as described in user stories.
### User Stories
```
As a User
I can create an order with the following details:
-  user id
-  order quantity (e.g.: 3.5 kg)
-  price per kg (e.g.: £303)
-  order type: BUY or SELL
```

```
As a User
I can cancel a registered order - this will remove the order from 'Live Order Board'
```

```
As User
I can see what quantity of each product has been ordered, where quantities of the same products add up.
```

```
As a User
I can see SELL orders on the board in ascending order

```

```
As a User
I can see BUY orders on the board in descending order

```

### To run tests:

```
$ rspec
```

### To run linting:

```
$ rubocop
```
