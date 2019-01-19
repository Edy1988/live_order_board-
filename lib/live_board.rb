require 'order'

class LiveBoard

  def initialize
    @sell_orders = []
    @buy_orders = []
  end

  def register(order)
    if order.type == :sell
      @sell_orders << order
    else
      @buy_orders << order
    end
  end

  def summary
    return "There are no orders registered." if @sell_orders.empty? && @buy_orders.empty?

    formatted_sell_orders = merge_by_price(@sell_orders).sort.map { |(price, quantity)|
      "SELL: #{quantity}kg for £#{price}"
    }

    formatted_buy_orders = merge_by_price(@buy_orders).sort.reverse.map { |(price, quantity)|
      "BUY: #{quantity}kg for £#{price}"
    }

    (formatted_sell_orders + formatted_buy_orders).join("\n")
  end

  def cancel(order)
    if order.type == :sell
      @sell_orders.delete(order)
    else
      @buy_orders.delete(order)
    end
  end

  private
  def merge_by_price(orders)
    orders.reduce({}) { |merged, order|
      if merged.key?(order.price_per_kg)
        merged[order.price_per_kg] += order.quantity
      else
        merged[order.price_per_kg] = order.quantity
      end
      merged
    }
  end

end
