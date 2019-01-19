require 'live_board'

describe 'LiveBoard' do

  it 'generates empty summary when no orders registered' do
    board = LiveBoard.new

    expect(board.summary).to eq "There are no orders registered."
  end

  it 'generates summary of one sell order' do
    board = LiveBoard.new

    board.register(Order.new(user_id: "user1", quantity: 7.5, price_per_kg: 80, type: :sell))

    expect(board.summary).to eq "- 7.5kg for £80"
  end

  it 'generates summary of sell orders in ascending order by price' do
    board = LiveBoard.new

    board.register(Order.new(user_id: "user1", quantity: 5.5, price_per_kg: 100, type: :sell))
    board.register(Order.new(user_id: "user2", quantity: 10, price_per_kg: 50.78, type: :sell))
    board.register(Order.new(user_id: "user3", quantity: 3.2, price_per_kg: 75, type: :sell))

    expect(board.summary).to eq(
      "- 10kg for £50.78\n" +
      "- 3.2kg for £75\n" +
      "- 5.5kg for £100"
    )
  end

end
