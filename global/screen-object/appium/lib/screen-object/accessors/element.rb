module ScreenObject
  module AppElements

    class Element

      attr_reader :locator

      def initialize(locator)
        @locator=locator.split("~")
      end

      def driver
        $driver
      end

      def click
          element.click
      end

      def value
          element.value
      end

      def exists?
        begin
          element.displayed?
        rescue
          false
        end
      end

      def element
        driver.find_element(:"#{locator[0]}",locator[1])
      end

      def elements
        driver.find_elements(:"#{locator[0]}",locator[1])
      end

      def element_attributes
        %w[name id value text]
      end

      def dynamic_xpath(text)
              concat_attribute=[]
        element_attributes.each{|i| concat_attribute << %Q(@#{i}='#{text}')}
        puts  "//#{locator[0]}[#{concat_attribute.join(' or ')}]"
        locator1="xpath~//#{locator[0]}[#{concat_attribute.join(' or ')}]"
        @locator=locator1.split("~")
        element

      end

    end

  end
end
