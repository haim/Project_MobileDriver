require 'appium_lib'
require 'require_all'
require 'rspec'
require 'data_magic'
include DataMagic


require File.expand_path('../../utilities/TestData',__FILE__)
include TestData
require File.expand_path('../../objects/ObjectRepository.rb',__FILE__)
require_all(File.expand_path('../../screens',__FILE__))
require_all(File.expand_path('../../screen-object',__FILE__))

World(ScreenObject::ScreenFactory)

@platform_name = ENV["PLATFORM_NAME"]
@device_name = ENV["DEVICE_NAME"]
@appPackage = ENV["APP_PACKAGE"]
@appActivity = ENV["APP_ACTIVITY"]
@AppPath = ENV['APP_PATH']
@Profile = ENV['PROFILE']


puts "########################################"
puts "Platform-Name : #{@platform_name}"
puts "Device-Name : #{@device_name}"
puts "App-Path : #{@AppPath}"
puts "App-Package : #{@appPackage}"
puts "App-Activity : #{@appActivity}"
puts "Profile : #{@Profile}"
puts "########################################"

if @AppPath.nil?
  Appium::Driver.new(Appium.load_appium_txt file: File.expand_path('') + "/global/utilities/appium.txt", verbose: true)
else
  if File.extname(@AppPath).end_with?(".app") || File.extname(@AppPath).end_with?(".ipa") || File.extname(@AppPath).end_with?(".apk")
    if File.exist?(@AppPath)
      Appium::Driver.new({ caps: { platformName: @platform_name,deviceName: @device_name,app: @AppPath,appPackage: @appPackage,appActivity: @appActivity} })
    else
      puts "** App not available in the specified path ** Execution Quits !"
      exit 0
    end
  else
    puts "** App extension not supported ** Execution Quits !
Supported app extension .app|.ipa !"
    exit 0
  end
end
