

module ScreenObject
  module ScreenFactory
    def on(screen_class, &blk)
      @current_screen = screen_class.new
      #sleep(1)
      blk.call screen if blk
      @current_screen
    end

  end
end
