
import 'package:flutter_test/flutter_test.dart';
import 'package:my_movie/core/domain/value_object.dart';
import 'package:my_movie/features/movie/domain/entities/genre.dart';

void main() {
  group('genre entity', () {
    test('create test with full value', () {
      final genre = Genre(
        id: UniqueId(1),
        name: StringSingleLine('Action'),
      );

      expect(genre.id.getOrCrash(), 1);
      expect(genre.name.getOrCrash(), 'Action');
    });
  });
}
