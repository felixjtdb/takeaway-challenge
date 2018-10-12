require 'menu.rb'

describe Menu do
  it "lists menu dishes with prices" do
    expect(subject.list_dishes).to eq subject.dishes
  end
end
