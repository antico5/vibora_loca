module Controls
  def mappings
    @mappings ||= { Gosu::KbLeft  => { action: :move, params: [-1,0] },
                    Gosu::KbRight => { action: :move, params: [1,0]  },
                    Gosu::KbUp    => { action: :move, params: [0,-1] },
                    Gosu::KbDown  => { action: :move, params: [0,1]  } }
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
