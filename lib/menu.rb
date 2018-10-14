class Menu
  attr_reader :dishes
  def initialize
    @dishes = {
      "springroll" => 2,
      "duck"       => 5
    }
  end

  def list_dishes
    @dishes
  end
end
