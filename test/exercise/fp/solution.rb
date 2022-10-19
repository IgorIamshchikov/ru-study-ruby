module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def film_meet_conditions?(film)
        !film['country'].nil? &&
          film['country'].split(',').length > 1 &&
          film['rating_kinopoisk'].to_f.positive?
      end

      def rating(array)
        array_ratings = array.map do |film|
          film['rating_kinopoisk'].to_f if film_meet_conditions?(film)
        end

        array_ratings.compact!
        array_ratings.reduce(:+) / array_ratings.size
      end

      def chars_count(films, threshold)
        film_names = films.map do |film|
          film['name'] if film['rating_kinopoisk'].to_f >= threshold
        end

        film_names.compact!
        film_names.map { |film| film.count('и') }.reduce(:+)
      end
    end
  end
end
