
require 'require_all'
# require 'screen-object'
require_all(File.expand_path('../../../global/utilities/env.rb',__FILE__))

Before {
  ScreenObject::Load_App.start_driver
}

After {
  ScreenObject::Load_App.quit_driver
}
