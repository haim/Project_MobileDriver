
module ScreenObject
  module AppElements
    class Text < AppElements::Element

      def text
        element.text()
      end

      def dynamic_text_exists? dynamic_text
         begin
          dynamic_xpath(dynamic_text).displayed?
        rescue
          false
        end
      end

    end
  end
end
