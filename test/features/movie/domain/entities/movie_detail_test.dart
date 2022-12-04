import 'package:flutter_test/flutter_test.dart';
import 'package:my_movie/core/domain/value_object.dart';
import 'package:my_movie/features/movie/domain/entities/genre.dart';
import 'package:my_movie/features/movie/domain/entities/movie.dart';
import 'package:my_movie/features/movie/domain/entities/movie_detail.dart';
import 'package:my_movie/features/movie/domain/entities/value_objects.dart';

void main() {
  group('movie detail entity', () {
    final genres = <Genre>[
      Genre(id: UniqueId(1), name: StringSingleLine('Action'))
    ];

    final relatedMovies = <Movie>[];

    test('create test with full value', () {
      final now = DateTime.now();
      final movie = MovieDetail(
        id: UniqueId(1),
        title: Title('Hero'),
        poster: Poster('/2d'),
        duration: const Duration(minutes: 147),
        rating: Rating(4.5),
        releaseDate: now,
        genres: genres,
        synopsis: 'A synopsis',
        trailer: Trailer('https://youtube.com/watch?v=29wadk2ll1302'),
        relatedMovie: relatedMovies,
      );

      expect(movie.id.getOrCrash(), 1);
      expect(movie.title.getOrCrash(), 'Hero');
      expect(movie.poster.getOrCrash(), 'https://image.tmdb.org/t/p/w185/2d');
      expect(movie.duration.inMinutes, 147);
      expect(movie.rating.getOrCrash(), 4.5);
      expect(movie.releaseDate, now);
      expect(movie.genres, genres);
      expect(movie.synopsis, 'A synopsis');
      expect(movie.trailer.getOrCrash(),
          'https://youtube.com/watch?v=29wadk2ll1302');
      expect(movie.relatedMovie, relatedMovies);
    });
  });
}
