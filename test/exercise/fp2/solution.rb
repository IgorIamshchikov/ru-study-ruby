module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each
        i = 0
        while i < size
          yield self[i]
          i += 1
        end
        self
      end

      # Написать свою функцию my_map
      def my_map
        my_array = MyArray.new
        my_each { |el| my_array << yield(el) }
        my_array
      end

      # Написать свою функцию my_compact
      def my_compact
        my_array = MyArray.new
        my_each { |el| my_array << el unless el.nil? }
        my_array
      end

      # Написать свою функцию my_reduce
      def my_reduce(acc = nil)
        my_each { |el| acc = acc ? yield(acc, el) : el }
        acc
      end
    end
  end
end
