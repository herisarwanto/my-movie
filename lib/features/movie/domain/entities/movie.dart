import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_movie/core/domain/value_object.dart';
import 'package:my_movie/features/movie/domain/entities/value_objects.dart';

part 'movie.freezed.dart';

@freezed
class Movie with _$Movie {
  const factory Movie({
    required UniqueId id,
    required Title title,
    required Poster poster,
    required DateTime releaseDate,
    required Rating rating,
    required Trailer trailer,
  }) = _Movie;
}
