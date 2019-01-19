require 'live_board'

describe 'LiveBoard' do

  it 'starts empty' do
    board = LiveBoard.new

    expect(board.all_orders.length).to eq 0
  end

end
