require 'order'

class LiveBoard

  def initialize
    @all_orders = []
  end

  def register(order)
    @all_orders << order
  end

  def summary
    return "There are no orders registered." if @all_orders.empty?

    @all_orders.sort{ |o1, o2|
      o1.price_per_kg <=> o2.price_per_kg
    }.map { |order|
      "- #{order.quantity}kg for £#{order.price_per_kg}"
    }.join("\n")
  end

  def cancel(order)
    @all_orders.delete(order)
  end

end
