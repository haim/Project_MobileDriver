#require_relative File.expand_path('../element',__FILE__)

module ScreenObject
  module AppElements
    class Button < AppElements::Element

      def click
          element.click
      end

      def enabled?
        begin
          element.enabled?
        rescue
          false
        end
      end

     end
  end
end




    