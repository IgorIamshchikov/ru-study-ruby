module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each(&block)
        first, *rest = self
        yield first
        rest.empty? ? [first] : [first, *MyArray.new(rest).my_each(&block)]
      end

      # Написать свою функцию my_map
      def my_map
        MyArray.new(my_reduce([]) { |acc, el| acc << yield(el) })
      end

      # Написать свою функцию my_compact
      def my_compact
        MyArray.new(my_reduce([]) { |acc, el| el.nil? ? acc : acc << el })
      end

      # Написать свою функцию my_reduce
      def my_reduce(acc = nil, &block)
        first, *rest = self
        acc = acc.nil? ? first : yield(acc, first)
        rest.empty? ? acc : MyArray.new(rest).my_reduce(acc, &block)
      end
    end
  end
end
