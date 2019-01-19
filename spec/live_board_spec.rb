require 'live_board'

describe 'Live Order Board' do

  it 'generates empty summary when no orders registered' do
    board = LiveBoard.new

    expect(board.summary).to eq "There are no orders registered."
  end

  it 'generates summary of one sell order' do
    board = LiveBoard.new

    board.register(sell_order(quantity_in_kg: 7.5, price_per_kg: 80))

    expect(board.summary).to eq "SELL: 7.5kg for £80"
  end

  it 'generates summary of sell orders in ascending order by price' do
    board = LiveBoard.new

    board.register(sell_order(quantity_in_kg: 5.5, price_per_kg: 100))
    board.register(sell_order(quantity_in_kg: 10, price_per_kg: 50.78))
    board.register(sell_order(quantity_in_kg: 3.2, price_per_kg: 75))

    expect(board.summary).to eq(
      "SELL: 10kg for £50.78\n" +
      "SELL: 3.2kg for £75\n" +
      "SELL: 5.5kg for £100"
    )
  end

  it 'generates summary of sell orders merging same price orders' do
    board = LiveBoard.new

    board.register(sell_order(quantity_in_kg: 6.5, price_per_kg: 78.55))
    board.register(sell_order(quantity_in_kg: 10, price_per_kg: 50.78))
    board.register(sell_order(quantity_in_kg: 2.8, price_per_kg: 78.55))

    expect(board.summary).to eq(
      "SELL: 10kg for £50.78\n" +
      "SELL: 9.3kg for £78.55"
    )
  end

  it 'can cancel a sell order' do
    board = LiveBoard.new
    sell_order_to_cancel = sell_order(quantity_in_kg: 10, price_per_kg: 50.78)

    board.register(sell_order(quantity_in_kg: 5.5, price_per_kg: 100))
    board.register(sell_order_to_cancel)
    board.register(sell_order(quantity_in_kg: 3.2, price_per_kg: 75))

    board.cancel(sell_order_to_cancel)

    expect(board.summary).to eq(
      "SELL: 3.2kg for £75\n" +
      "SELL: 5.5kg for £100"
    )
  end

  it 'generates summary of one buy order' do
    board = LiveBoard.new

    board.register(buy_order(quantity_in_kg: 7.5, price_per_kg: 80))

    expect(board.summary).to eq "BUY: 7.5kg for £80"
  end

  it 'generates summary of buy orders in descending order by price' do
    board = LiveBoard.new

    board.register(buy_order(quantity_in_kg: 5.5, price_per_kg: 100))
    board.register(buy_order(quantity_in_kg: 10, price_per_kg: 50.78))
    board.register(buy_order(quantity_in_kg: 3.2, price_per_kg: 75))

    expect(board.summary).to eq(
      "BUY: 5.5kg for £100\n" +
      "BUY: 3.2kg for £75\n" +
      "BUY: 10kg for £50.78"
    )
  end

  it 'generates summary of buy orders merging same price orders' do
    board = LiveBoard.new

    board.register(buy_order(quantity_in_kg: 6.5, price_per_kg: 78.55))
    board.register(buy_order(quantity_in_kg: 10, price_per_kg: 50.78))
    board.register(buy_order(quantity_in_kg: 2.8, price_per_kg: 78.55))

    expect(board.summary).to eq(
      "BUY: 9.3kg for £78.55\n" +
      "BUY: 10kg for £50.78"
    )
  end

  it 'can cancel a buy order' do
    board = LiveBoard.new
    buy_order_to_cancel = buy_order(quantity_in_kg: 10, price_per_kg: 50.78)

    board.register(buy_order(quantity_in_kg: 5.5, price_per_kg: 100))
    board.register(buy_order_to_cancel)
    board.register(buy_order(quantity_in_kg: 3.2, price_per_kg: 75))

    board.cancel(buy_order_to_cancel)

    expect(board.summary).to eq(
      "BUY: 5.5kg for £100\n" +
      "BUY: 3.2kg for £75"
    )
  end

  it 'generates summary of sell and buy orders' do
    board = LiveBoard.new

    board.register(buy_order(quantity_in_kg: 6.5, price_per_kg: 78.55))
    board.register(sell_order(quantity_in_kg: 7.5, price_per_kg: 75))
    board.register(buy_order(quantity_in_kg: 12.7, price_per_kg: 102.4))
    board.register(sell_order(quantity_in_kg: 10, price_per_kg: 50.78))
    board.register(sell_order(quantity_in_kg: 2.8, price_per_kg: 75))
    board.register(buy_order(quantity_in_kg: 2.8, price_per_kg: 78.55))

    expect(board.summary).to eq(
      "SELL: 10kg for £50.78\n" +
      "SELL: 10.3kg for £75\n" +
      "BUY: 12.7kg for £102.4\n" +
      "BUY: 9.3kg for £78.55"
    )
  end

  def sell_order(quantity_in_kg:, price_per_kg:)
    Order.new(user_id: "any", quantity_in_kg: quantity_in_kg, price_per_kg: price_per_kg, type: :sell)
  end

  def buy_order(quantity_in_kg:, price_per_kg:)
    Order.new(user_id: "any", quantity_in_kg: quantity_in_kg, price_per_kg: price_per_kg, type: :buy)
  end

end
