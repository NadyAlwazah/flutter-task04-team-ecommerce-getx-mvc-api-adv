class StatusClass {
  final String type;
  final String? message;

  const StatusClass._({required this.type, this.message});

  static const isLoading = StatusClass._(type: "isLoading");

  static const noInternet = StatusClass._(type: "noInternet");

  static const noData = StatusClass._(type: "noData");

  static const serverError = StatusClass._(type: "serverError");

  static const success = StatusClass._(type: "success");

  static const init = StatusClass._(type: "init");

  static const anotherError = StatusClass._(type: "anotherError");

  static StatusClass getAnotherError({required String message}) {
    return StatusClass._(type: "anotherError", message: message);
  }
}
