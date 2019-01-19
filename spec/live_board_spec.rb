require 'live_board'

describe 'LiveBoard' do

  it 'starts empty' do
    board = LiveBoard.new

    expect(board.all_orders.length).to eq 0
  end

  it 'stores registered orders' do
    board = LiveBoard.new

    order1 = Order.new(user_id: "user", quantity: 10, price_per_kg: 50, type: :sell)
    order2 = Order.new(user_id: "user1", quantity: 1, price_per_kg: 10, type: :buy)

    board.register(order1)
    board.register(order2)

    expect(board.all_orders.length).to eq 2
    expect(board.all_orders[0]).to eq order1
    expect(board.all_orders[1]).to eq order2
  end

end
