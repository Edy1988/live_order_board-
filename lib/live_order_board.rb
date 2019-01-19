require_relative 'order'

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

  def cancel(order)
    if order.type == :sell
      @sell_orders.delete(order)
    else
      @buy_orders.delete(order)
    end
  end

  def summary
    return "There are no orders registered." if empty?

    (formatted_sell_orders + formatted_buy_orders).join("\n")
  end

private
  def empty?
    @sell_orders.empty? && @buy_orders.empty?
  end

  def formatted_sell_orders
    merge_by_price(@sell_orders).sort.map { |(price, quantity)|
      format(quantity: quantity, price: price, label: "SELL")
    }
  end

  def formatted_buy_orders
    merge_by_price(@buy_orders).sort_by { |(price, _)|
      -price
    }.map { |(price, quantity)|
      format(quantity: quantity, price: price, label: "BUY")
    }
  end

  def format(quantity:, price:, label:)
    "#{label}: #{quantity}kg for £#{price}"
  end

  def merge_by_price(orders)
    orders.reduce({}) { |merged, order|
      if merged.key?(order.price_per_kg)
        merged[order.price_per_kg] += order.quantity_in_kg
      else
        merged[order.price_per_kg] = order.quantity_in_kg
      end
      merged
    }
  end

end
