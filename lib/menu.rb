class Menu
  attr_reader :dishes
  def initialize
    @dishes = {}

  end
  def list_dishes
    @dishes
  end
end
