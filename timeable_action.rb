module TimeableAction

  module ClassMethods
    def timeable_action interval, name
      define_method(name) do |*args, &block|
        allow_every interval, name do
          send "#{name}_action", *args
        end
      end
    end
  end

  def allow_every interval, key, &b
    if can_perform?(interval, key)
      reset_timer key
      yield
    end
  end

  def action_timers
    @timers ||= Hash.new 0
  end

  def can_perform? interval, key
    elapsed(key) > interval
  end

  def elapsed key
    Time.now.to_f - action_timers[key]
  end

  def reset_timer key
    action_timers[key] = Time.now.to_f
  end

  def self.included mod
    mod.extend ClassMethods
  end

end
