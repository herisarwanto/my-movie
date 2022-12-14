import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_movie/core/domain/value_object.dart';
import 'package:my_movie/features/movie/domain/entities/genre.dart';
import 'package:my_movie/features/movie/domain/entities/movie.dart';
import 'package:my_movie/features/movie/domain/entities/value_objects.dart';

part 'movie_detail.freezed.dart';

@freezed
class MovieDetail with _$MovieDetail {
  const factory MovieDetail({
    required UniqueId id,
    required Title title,
    required Poster poster,
    required Duration duration,
    required Rating rating,
    required DateTime releaseDate,
    required List<Genre> genres,
    required String synopsis,
    required Trailer trailer,
    required List<Movie> relatedMovie,
  }) = _MovieDetail;
}
