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
    raise "Basket empty" if @order_list.empty?
    @order_list.each_pair do |dish, occurance|
      puts "#{occurance} X #{dish} = £#{occurance * @menu.dishes[dish]}"
    end
    puts "total : £#{@total_price}"
  end

  def complete_order(expected_bill)
    price_check(expected_bill) ? text = Text.new : return "bills dpnt match, look in your basket"
    text.send_text
  end

  private
  def price_check(price)
    @total_price == price
  end
end
