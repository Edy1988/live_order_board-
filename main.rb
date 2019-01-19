require './lib/live_order_board'

board = LiveOrderBoard.new

board.register(Order.new(user_id: "user", quantity_in_kg: 3.4, price_per_kg: 82.98, type: :sell))
board.register(Order.new(user_id: "user1", quantity_in_kg: 6.5, price_per_kg: 78.55, type: :buy))
board.register(Order.new(user_id: "user2", quantity_in_kg: 7.5, price_per_kg: 75, type: :sell))
board.register(Order.new(user_id: "user3", quantity_in_kg: 12.7, price_per_kg: 102.4, type: :buy))
board.register(Order.new(user_id: "user4", quantity_in_kg: 2.8, price_per_kg: 78.55, type: :buy))
board.register(Order.new(user_id: "user5", quantity_in_kg: 2.8, price_per_kg: 75, type: :sell))

order_to_cancel = Order.new(user_id: "user6", quantity_in_kg: 10, price_per_kg: 50.78, type: :sell)
board.register(order_to_cancel)
board.cancel(order_to_cancel)

puts board.summary
