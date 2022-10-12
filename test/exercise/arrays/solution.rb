module Exercise
  module Arrays
    class << self
      def replace(array)
        max = 0
        array.each do |x|
          if x > max
            max = x
          end
        end
        array.map do |i|
          if i > 0
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
          mid = (min + max)/2.round
          midVal = array[mid]
          if midVal == query
            return mid
          elsif midVal > query
            max = mid - 1
          else 
            min = mid + 1
          end
        end
        return -1
      end
    end
  end
end
