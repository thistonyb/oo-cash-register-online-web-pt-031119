class CashRegister
  attr_accessor :discount, :total, :title, :quantity, :price, :item_array

  def initialize(discount = 0)
    @discount = discount
    @total = 0
    @item_array = []
  end

  def add_item(title, price, quantity = 1)
    @price = price
    @title = title
    @quantity = quantity
    @quantity.times do
      @item_array << @title
    end
    @total += @price * @quantity
  end

  def apply_discount
    if @discount == 0
      return "There is no discount to apply."
    else
      discount = @discount.to_f / 100
      amount_off = @total * discount
      @total = @total - amount_off
      "After the discount, the total comes to $#{@total.to_i}."
    end
  end

  def items
    @item_array
  end

  def void_last_transaction
    @quantity.times do
      @item_array.pop
    end
    @total -= @price * @quantity
  end
end
