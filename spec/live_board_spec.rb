require 'live_board'

describe 'LiveBoard' do

  it 'starts empty' do
    board = LiveBoard.new

    expect(board.all_orders.length).to eq 0
  end
  
  it 'stores registered orders' do
    board = LiveBoard.new

    board.register(user_id: "user", quantity: 10, price_per_kg: 50, type: "SELL")
    board.register(user_id: "user1", quantity: 1, price_per_kg: 10, type: "BUY")

    expect(board.all_orders.length).to eq 2
    expect(board.all_orders[0].user_id).to eq "user"
    expect(board.all_orders[0].quantity).to eq 10
    expect(board.all_orders[0].price_per_kg).to eq 50
    expect(board.all_orders[0].type).to eq "SELL"

    expect(board.all_orders.length).to eq 2
    expect(board.all_orders[1].user_id).to eq "user1"
    expect(board.all_orders[1].quantity).to eq 1
    expect(board.all_orders[1].price_per_kg).to eq 10
    expect(board.all_orders[1].type).to eq "BUY"

  end

end
