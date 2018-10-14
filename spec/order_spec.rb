require 'order.rb'

describe Order do
  dish1 = "springroll"
  dish2 = "duck"

  describe "#order" do
    it "order placed is added to order_list" do
      subject.order(dish1)
      expect(subject.order_list).to eq({dish1 => 1})
    end
    it "multiple orders can be placed" do
      2.times{subject.order(dish1)}
      subject.order(dish2)
      expect(subject.order_list).to eq({dish1 => 2, dish2 => 1})
    end
    it "error returned if order is not on menu" do
      expect{subject.order("Burger")}.to raise_error "Sorry that dish is not on this menu"
    end
    it "order total is increases by added items price" do
      expect{subject.order(dish1)}.to change{subject.total_price}.by(subject.menu.dishes[dish1])
    end
  end

  describe '#basket' do
    it "returns order_list in a user friendly format" do
      subject.order(dish1)
      expect{subject.basket}.to output("1 X #{dish1} = £2\ntotal : £2\n").to_stdout
    end
  end

  describe "#complete_order" do
    it "complete order when total matches expected total" do
      subject.order(dish1)
      expect(subject.complete_order(2)).to eq "text sent"
    end
    it "complete order when total doesnt match expected total" do
      subject.order(dish1)
      expect(subject.complete_order(5)).to eq subject.basket
    end
  end
end
