require_relative "controls"
require_relative "timeable_action"

class Snake
  include Controls
  include TimeableAction

  attr_accessor :x, :y, :game, :direction

  timeable_action 0.2, :move

  DISPLACEMENTS = { down:  [ 0,  1],
                    up:    [ 0, -1],
                    right: [ 1,  0],
                    left:  [-1,  0] }

  HEAD_ROTATIONS = { up:     90,
                     right: 180,
                     down:  270,
                     left:    0 }

  def initialize game
    game.register self
    @x = @y = 0
    @game = game
    @direction = :down
    @grow_count = 0
    @bodies = [position]
    grow 3
  end

  def update
    handle_controls
    auto_move
    check_death
  end

  def draw
    map.draw x, y, head_image, rotation: HEAD_ROTATIONS[direction]
    @bodies.each do |body|
      map.draw body[:x], body[:y], body_image
    end
  end

  def move_action direction
    move_body
    displacement = DISPLACEMENTS[direction]
    self.x += displacement[0]
    self.y += displacement[1]
  end

  def grow size
    size.times do
      @bodies.push @bodies.last.dup
    end
  end

  private
    def check_death
      game.close if dead?
    end

    def dead?
      @bodies.include?(position) || map.out_of_bounds?(position)
    end

    def auto_move
      move direction
    end

    def move_body
      @bodies.unshift position
      @bodies.pop
    end

    def map
      game.map
    end

    def position
      {x: x, y: y}
    end

    def head_image
      @head_image ||= game.image "head.png"
    end

    def body_image
      @body_image ||= game.image "body.jpg"
    end

end
