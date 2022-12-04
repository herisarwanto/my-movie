import 'package:my_movie/core/domain/value_failure.dart';

class UnexpectedValueError extends Error {
  UnexpectedValueError(this.valueFailure);

  // ignore: strict_raw_type
  final ValueFailure valueFailure;

  @override
  String toString() {
    const explanation =
        'Encountered a ValueFailure at an unrecoverable point. Terminating.';
    return Error.safeToString('$explanation Failure was: $valueFailure');
  }
}
