import 'dart:developer';
import 'dart:io';

Future<bool> checkInternet() async {
  log("Checking Internet");

  try {
    final result = await InternetAddress.lookup('google.com');

    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      log("Connected");
      return true;
    }

    return false;
  } on SocketException catch (_) {
    log("No Internet");
    return false;
  } on Exception catch (e) {
    log("Check Internet Error");
    log(e.toString());
    return false;
  }
}
