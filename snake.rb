require_relative "controls"
require_relative "timeable_action"

class Snake
  include Controls
  include TimeableAction

  attr_accessor :x, :y, :image, :game, :direction

  timeable_action 0.5, :move

  DISPLACEMENTS = { down:  [ 0,  1],
                    up:    [ 0, -1],
                    right: [ 1,  0],
                    left:  [-1,  0] }

  def initialize game
    game.register self
    @x = @y = 0
    @game = game
    @image = game.image "head.jpg"
    @direction = :down
  end

  def update
    handle_controls
    auto_move
  end

  def draw
    map.draw x, y, image
  end

  def move_action direction
    displacement = DISPLACEMENTS[direction]
    self.x += displacement[0]
    self.y += displacement[1]
  end

  private

    def auto_move
      move direction
    end

    def map
      game.map
    end

end
