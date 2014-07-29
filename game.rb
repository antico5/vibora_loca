require 'gosu'
require 'pry'

require_relative "snake"
require_relative "map"

class Game < Gosu::Window
  XRES = 640
  YRES = 640

  attr_accessor :map

  def initialize
    super XRES, YRES, false
    @objects = []
    self.caption = "La viborita loca"
    spawn_snake
    create_map
  end

  def update
    @objects.each &:update

  end

  def draw
    @objects.each &:draw
  end

  def register obj
    @objects << obj
  end

  def image file
    Gosu::Image.new(self, "media/#{file}", false)
  end

  private
    def spawn_snake
      Snake.new self
    end

    def create_map
      self.map = Map.new self
    end
end

window = Game.new
window.show
