require_relative "controls"

class Snake
  include Controls

  attr_accessor :x, :y, :image, :game

  def initialize game
    game.register self
    @x = @y = 0
    @game = game
    @image = game.image "head.jpg"
  end

  def update
    handle_controls
  end

  def draw
    image.draw x, y, 1
  end

  def up
    self.y -= 10
  end

  def down
    self.y += 10
  end

  def left
    self.x -= 10
  end

  def right
    self.x += 10
  end
end
