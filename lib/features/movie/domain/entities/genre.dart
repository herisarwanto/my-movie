import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_movie/core/domain/value_object.dart';

part 'genre.freezed.dart';

@freezed
class Genre with _$Genre {
  const factory Genre({
    required UniqueId id,
    required StringSingleLine name,
  }) = _Genre;
}
