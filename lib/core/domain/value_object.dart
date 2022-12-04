import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_movie/core/domain/error.dart';
import 'package:my_movie/core/domain/value_failure.dart';
import 'package:my_movie/core/domain/value_validator.dart';

// ignore: one_member_abstracts
abstract class IValidatable {
  bool isValid();
}

@immutable
abstract class ValueObject<T> implements IValidatable {
  const ValueObject();
  Either<ValueFailure<T>, T> get value;

  T getOrCrash() => value.fold((l) => throw UnexpectedValueError(l), id);

  T getOrElse(T dflt) => value.getOrElse(() => dflt);

  Either<ValueFailure<dynamic>, Unit> get failureOrUnit =>
      value.fold(left, (r) => right(unit));

  @override
  bool isValid() => value.isRight();

  @override
  bool operator == (Object other) {
    if (identical(this, other)) return true;
    return other is ValueObject<T> && other.value == value;
  }

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => 'Value($value)';
}

class UniqueId extends ValueObject<int> {
  factory UniqueId(int? input) {
    assert(input != null, 'id cannot be null');
    return UniqueId._(right(input!));
  }

  const UniqueId._(this.value);

  @override
  final Either<ValueFailure<int>, int> value;
}

class StringSingleLine extends ValueObject<String> {
  factory StringSingleLine(String? input) {
    assert(input != null, 'input value cannot be null');
    return StringSingleLine._(
      validateStringNotEmpty(input!).flatMap(validateSingleLine),
    );
  }

  const StringSingleLine._(this.value);

  @override
  final Either<ValueFailure<String>, String> value;
}
