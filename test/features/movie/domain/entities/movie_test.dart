import 'package:flutter_test/flutter_test.dart';
import 'package:my_movie/core/domain/value_object.dart';
import 'package:my_movie/features/movie/domain/entities/movie.dart';
import 'package:my_movie/features/movie/domain/entities/value_objects.dart';

void main() {
  group('movie entity', () {
    test('create with full value', () {
      final now = DateTime.now();
      final movie = Movie(
        id: UniqueId(1),
        title: Title('Hero'),
        poster: Poster('/2d'),
        releaseDate: now,
        rating: Rating(4.5),
        trailer: Trailer('https://youtube.com/watch?v=29wadk2ll1302'),
      );

      expect(movie.id.getOrCrash(), 1);
      expect(movie.title.getOrCrash(), 'Hero');
      expect(movie.poster.getOrCrash(), 'https://image.tmdb.org/t/p/w185/2d');
      expect(movie.releaseDate, now);
      expect(
        movie.trailer.getOrCrash(),
        'https://youtube.com/watch?v=29wadk2ll1302',
      );
    });

    test('create with some value missing', () {
      final now = DateTime.now();
      final movie = Movie(
        id: UniqueId(1),
        title: Title('Hero'),
        poster: Poster(null),
        releaseDate: now,
        rating: Rating(4.5),
        trailer: Trailer(null),
      );

      expect(movie.id.getOrCrash(), 1);
      expect(movie.title.getOrCrash(), 'Hero');
      expect(movie.poster.getOrCrash(), 'https://via.placeholder.com/200');
      expect(movie.releaseDate, now);
      expect(
        movie.trailer.getOrCrash(),
        'https://www.youtube.com/watch?v=PWbRleMGagU&list=RDjZhW9pupZfI',
      );
    });
  });
}
