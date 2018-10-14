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

  def contains_item?(item)
    @order_list.include?(item) ? true : false
  end

  def format_order
    @order_list.each_pair do |dish, occurance|
      "#{occurance} X #{dish}"
    end

  end



end
