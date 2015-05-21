
module ScreenObject
  module Load_App

    def self.start_driver
      $driver.start_driver
    end

    def self.quit_driver
      $driver.driver_quit
    end

    def self.load_driver(appium_txt)



      #Appium.promote_singleton_appium_methods ScreenObject
    end

  end
end