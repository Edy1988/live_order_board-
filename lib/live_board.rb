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
    "There are no orders registered."
  end

end
