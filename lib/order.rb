require_relative 'menu'
class Order
  attr_reader :menu, :order_list, :total_price

  def initialize
    @menu = Menu.new
    @order_list = Hash.new(0)
    @total_price = 0
  end

  def order(dish)
    fail "Sorry that dish is not on this menu" unless @menu.dishes.include?(dish)
    @order_list[dish] += 1
    @total_price += @menu.dishes[dish]
  end

  def basket
    @order_list.each_pair do |dish, occurance|
      puts "#{occurance} X #{dish} = £#{occurance * @menu.dishes[dish]}"
    end
    puts "total : £#{@total_price}"
  end

  def price_check(price)
    @total_price == price
  end

  def complete_order
    basket
  end
end
