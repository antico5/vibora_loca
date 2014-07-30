require_relative "controls"
require_relative "timeable_action"

class Snake
  include Controls
  include TimeableAction
  extend ClassMethods

  attr_accessor :x, :y, :image, :game

  timeable_action 0.5, :move

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
    map.draw x, y, image
  end

  def move_action x, y
    self.x += x
    self.y += y
  end

  private

    def map
      game.map
    end
end
