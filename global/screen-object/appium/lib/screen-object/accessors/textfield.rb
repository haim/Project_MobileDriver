
module ScreenObject
  module AppElements
    class TextField < AppElements::Element

      def text=(text)
        element.send_keys text
      end

      def text
        element.text
      end
    
      def clear
        element.clear
      end

    end
  end
end
