import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;

  const Failure({required this.message});

  @override
  List<Object?> get props => [message];
}

class NoInternetFailure extends Failure {
  const NoInternetFailure() : super(message: 'No Internet Connection');
}

class ServerFailure extends Failure {
  const ServerFailure() : super(message: 'Server Error');
}

class NoDataFailure extends Failure {
  const NoDataFailure() : super(message: 'No Data Found');
}

class UnauthorizedFailure extends Failure {
  const UnauthorizedFailure() : super(message: 'Unauthorized');
}

class BadRequestFailure extends Failure {
  const BadRequestFailure() : super(message: 'Bad Request');
}

class UnknownFailure extends Failure {
  const UnknownFailure({required super.message});
}
