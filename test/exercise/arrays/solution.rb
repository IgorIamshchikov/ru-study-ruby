module Exercise
  module Arrays
    class << self
      def replace(array)
        max = 0
        array.each do |x|
          max = x if x > max
        end
        array.map do |i|
          if i.positive?
            max
          else
            i
          end
        end
      end

      def search(array, query)
        min = 0
        max = array.length - 1
        while min <= max
          mid = (min + max) / 2.round
          mid_val = array[mid]
          return mid if mid_val == query

          if mid_val > query
            max = mid - 1
          else
            min = mid + 1
          end
        end
        -1
      end
    end
  end
end
