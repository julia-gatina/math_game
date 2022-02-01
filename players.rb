class Player
  attr_accessor :name
  attr_accessor :life

  def initialize(name, life)
    @name = name
    @life = life
  end

  def lose_life
    @life -= 1
  end

end 