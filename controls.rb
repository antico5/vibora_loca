module Controls
  def mappings
    @mappings ||= { Gosu::KbLeft => :left,
                    Gosu::KbRight => :right,
                    Gosu::KbUp => :up,
                    Gosu::KbDown => :down }
  end

  def handle_controls
    mappings.each do |key, action|
      if game.button_down? key
        send action
      end
    end
    nil
  end

end
