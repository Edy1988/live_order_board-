require 'order'

class LiveBoard
  attr_reader :all_orders

  def initialize
    @all_orders = []
  end

  def register(user_id:, quantity:, price_per_kg:, type:)
    save(Order.new(user_id: user_id, quantity: quantity, price_per_kg: price_per_kg, type: type))
  end

  private
  def save(order)
    @all_orders << order
  end

end
