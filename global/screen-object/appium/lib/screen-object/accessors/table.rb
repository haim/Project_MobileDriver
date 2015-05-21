
module ScreenObject
  module AppElements
    class Table < AppElements::Element

      def cell_count
        elements.length
      end

    end
  end
end