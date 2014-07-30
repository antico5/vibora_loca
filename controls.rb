module Controls
  def mappings
    @mappings ||= { Gosu::KbLeft  => { action: :direction=, params: :left },
                    Gosu::KbRight => { action: :direction=, params: :right },
                    Gosu::KbUp    => { action: :direction=, params: :up },
                    Gosu::KbDown  => { action: :direction=, params: :down },
                    Gosu::KbSpace => { action: :grow, params: 1 }, }
  end

  def handle_controls
    mappings.each do |key, method|
      if game.button_down? key
        send method[:action], *method[:params]
      end
    end
    nil
  end

end
