import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/classes/failure.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/classes/status_class.dart';

extension FailureExtension on Failure {
  StatusClass toStatusClass() {
    if (this is NoInternetFailure) {
      return StatusClass.noInternet;
    }

    if (this is NoDataFailure) {
      return StatusClass.noData;
    }

    if (this is ServerFailure) {
      return StatusClass.serverError;
    }

    if (this is UnknownFailure) {
      return StatusClass.getAnotherError(message: message);
    }

    return StatusClass.anotherError;
  }
}
