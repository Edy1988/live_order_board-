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

    merged_orders_by_price.sort.map { |(price, quantity)|
      "SELL: #{quantity}kg for £#{price}"
    }.join("\n")
  end

  def cancel(order)
    @all_orders.delete(order)
  end

  private
  def merged_orders_by_price
    @all_orders.reduce({}) { |merged, order|
      if merged.key?(order.price_per_kg)
        merged[order.price_per_kg] += order.quantity
      else
        merged[order.price_per_kg] = order.quantity
      end
      merged
    }
  end

end
