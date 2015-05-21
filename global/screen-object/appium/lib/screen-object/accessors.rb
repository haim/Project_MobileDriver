
module ScreenObject
  module Accessors
    # contains  module level methods that are added into your screen objects
    # when you include the ScreenObject module.  These methods will be generated as services for screens.
    # Set of methods will be created for buttons
      def button(name, locator)
        #generates method for clicking button
        define_method(name) do
          ScreenObject::AppElements::Button.new(locator).click
        end


        #generates method for checking the existence of the button
        define_method("#{name}?") do
          ScreenObject::AppElements::Button.new(locator).exists?
        end



        define_method("#{name}_enabled?") do
          ScreenObject::AppElements::Button.new(locator).enabled?
        end

        define_method("#{name}_value") do
          ScreenObject::AppElements::Button.new(locator).value
        end
      end

      # CHECKBOX

      def checkbox(name, locator)
        define_method("check_#{name}") do
          ScreenObject::AppElements::CheckBox.new(locator).check
        end
         define_method("check1_#{name}") do
          ScreenObject::AppElements::CheckBox.new(locator).check1
        end

        define_method("uncheck_#{name}") do
          ScreenObject::AppElements::CheckBox.new(locator).uncheck
        end

        define_method("#{name}?") do
          ScreenObject::AppElements::CheckBox.new(locator).exists?
        end

        define_method("#{name}_checked?") do
          ScreenObject::AppElements::CheckBox.new(locator).checked?
        end

      end


      # Set of methods will be created for text fields/text
      def text(name,locator)

        define_method("#{name}?") do
          ScreenObject::AppElements::Text.new(locator).exists?
        end

        define_method("#{name}") do
          ScreenObject::AppElements::Text.new(locator).click
        end

        define_method("#{name}_text") do
          ScreenObject::AppElements::Text.new(locator).text
        end

        define_method("#{name}_dynamic?") do |text|
          ScreenObject::AppElements::Text.new(locator).dynamic_text_exists?(text)
        end

        define_method("#{name}_value") do
          ScreenObject::AppElements::Text.new(locator).value
        end

      end


      def text_field(name,locator)
        #generates method for setting text into text field
        define_method("#{name}=") do |text|
          ScreenObject::AppElements::TextField.new(locator).text=(text)
        end
        #generates method for comparing expected and actual text
        define_method("#{name}") do
          ScreenObject::AppElements::TextField.new(locator).text
        end
        
        define_method("clear_#{name}") do
          ScreenObject::AppElements::TextField.new(locator).clear
        end
        
        define_method("#{name}?") do
          ScreenObject::AppElements::TextField.new(locator).exists?
        end

        define_method("#{name}_value") do
          ScreenObject::AppElements::TextField.new(locator).value
        end
      end


      # Set of methods will be created for images
      def image(name,locator)
        #generates method for checking the existence of the image
        define_method("#{name}?") do
          ScreenObject::AppElements::Image.new(locator).exists?
        end
        #generates method for clicking image
        define_method("#{name}") do
          ScreenObject::AppElements::Image.new(locator).click
        end
       
      end

      def table(name, locator)
        #generates method for clicking button
        define_method("#{name}_cell_count") do
          ScreenObject::AppElements::Table.new(locator).cell_count
        end
      end

  end
end
