import 'package:fpdart/fpdart.dart';
import 'package:music/utils/exception/failure.dart';

abstract interface class UseCase<SuccessType> {
  Future<Either<Failure, SuccessType>> call();
}
