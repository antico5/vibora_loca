class Map
  HORIZONTAL_TILES = 20
  VERTICAL_TILES = 20

  attr_accessor :game

  def initialize game
    @game = game
  end

  def draw x, y, image, options = {}
    rotation = options[:rotation] || 0
    x = graphic_x(x)
    y = graphic_y(y)
    factors = scale_factors image
    image.draw_rot x, y, 1, rotation, 0.5, 0.5, factors[:x], factors[:y]
  end

  def out_of_bounds? position
    position[:x] < 0 ||
      position[:x] >= HORIZONTAL_TILES ||
      position[:y] < 0 ||
      position[:y] >= VERTICAL_TILES
  end

  private
    def graphic_x x
      x * tile_width
    end

    def graphic_y y
      y * tile_height
    end

    def tile_height
      @tile_height ||= game.height / VERTICAL_TILES
    end

    def tile_width
      @tile_width ||= game.width / HORIZONTAL_TILES
    end

    def scale_factors image
      { x: tile_width / image.width,
        y: tile_height / image.height }
    end

end
