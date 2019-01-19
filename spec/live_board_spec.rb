require 'live_board'

describe 'LiveBoard' do

  it 'generates empty summary when no orders registered' do
    board = LiveBoard.new

    expect(board.summary).to eq "There are no orders registered."
  end

  it 'generates summary of one sell order' do
    board = LiveBoard.new

    board.register(Order.new(user_id: "user1", quantity: 7.5, price_per_kg: 80, type: :sell))

    expect(board.summary).to eq "SELL: 7.5kg for £80"
  end

  it 'generates summary of sell orders in ascending order by price' do
    board = LiveBoard.new

    board.register(Order.new(user_id: "user1", quantity: 5.5, price_per_kg: 100, type: :sell))
    board.register(Order.new(user_id: "user2", quantity: 10, price_per_kg: 50.78, type: :sell))
    board.register(Order.new(user_id: "user3", quantity: 3.2, price_per_kg: 75, type: :sell))

    expect(board.summary).to eq(
      "SELL: 10kg for £50.78\n" +
      "SELL: 3.2kg for £75\n" +
      "SELL: 5.5kg for £100"
    )
  end

  it 'generates summary of sell orders merging same price orders' do
    board = LiveBoard.new

    board.register(Order.new(user_id: "user1", quantity: 6.5, price_per_kg: 78.55, type: :sell))
    board.register(Order.new(user_id: "user2", quantity: 10, price_per_kg: 50.78, type: :sell))
    board.register(Order.new(user_id: "user3", quantity: 2.8, price_per_kg: 78.55, type: :sell))

    expect(board.summary).to eq(
      "SELL: 10kg for £50.78\n" +
      "SELL: 9.3kg for £78.55"
    )
  end

  it 'can cancel a sell order' do
    board = LiveBoard.new
    order = Order.new(user_id: "user2", quantity: 10, price_per_kg: 50.78, type: :sell)

    board.register(Order.new(user_id: "user1", quantity: 5.5, price_per_kg: 100, type: :sell))
    board.register(order)
    board.register(Order.new(user_id: "user3", quantity: 3.2, price_per_kg: 75, type: :sell))

    board.cancel(order)

    expect(board.summary).to eq(
      "SELL: 3.2kg for £75\n" +
      "SELL: 5.5kg for £100"
    )
  end

end
