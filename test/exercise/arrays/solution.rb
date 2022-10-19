module Exercise
  module Arrays
    class << self
      def my_max(array)
        max = array[0]
        array.each { |el| max = el if el > max }
        max
      end

      def replace(array)
        max = my_max(array)
        array.map do |i|
          i.positive? ? max : i
        end
      end

      def search(array, query, min = 0, max = array.size - 1)
        return -1 if array.empty? || query < array[min] || query > array[max] || min > max

        mid = ((min + max) / 2).round
        mid_val = array[mid]
        return mid if mid_val == query

        mid_val > query ? search(array, query, min, mid - 1) : search(array, query, mid + 1, max)
      end
    end
  end
end
