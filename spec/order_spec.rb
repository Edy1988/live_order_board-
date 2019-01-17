require 'order'

describe Order do

  let(:type) { double :type }
  subject { Order.new(user_id: "user", quantity: 10, price_per_kg: 50, type: type) }

  it 'stores user_id of the order' do
    expect(subject.user_id).to eq "user"
  end

  it 'stores quantity ordered' do
    expect(subject.quantity).to eq 10
  end

  it 'stores price of the item ordered' do
    expect(subject.price_per_kg).to eq 50
  end

  it 'stores type of order' do
    expect(subject.type).to eq type
  end
end
