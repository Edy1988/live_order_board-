class Order
  attr_reader :user_id, :quantity_in_kg, :price_per_kg, :type

  def initialize(user_id:, quantity_in_kg:, price_per_kg:, type:)
    @user_id = user_id
    @quantity_in_kg = quantity_in_kg
    @price_per_kg = price_per_kg
    @type = type
  end
end
