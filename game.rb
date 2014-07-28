require 'observer'

require 'gosu'


require_relative "snake"

class Game < Gosu::Window
  XRES = 640
  YRES = 640

  def initialize
    super XRES, YRES, false
    @objects = []
    self.caption = "La viborita loca"
    spawn_snake
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
      snake = Snake.new self
      register snake
      snake
    end
end

window = Game.new
window.show
