require 'menu'
describe Menu do
  describe '#list_dishes' do
    it "lists order dishes with prices" do
      expect(subject.list_dishes).to eq subject.dishes
    end
  end
end
