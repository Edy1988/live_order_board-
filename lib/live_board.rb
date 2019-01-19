require 'order'

class LiveBoard
  attr_reader :all_orders

  def initialize
    @all_orders = []
  end

  def register(order)
    @all_orders << order
  end

  def summary
    return "There are no orders registered." if @all_orders.empty?

    "- #{@all_orders[0].quantity}kg for £#{@all_orders[0].price_per_kg}"
  end

end
