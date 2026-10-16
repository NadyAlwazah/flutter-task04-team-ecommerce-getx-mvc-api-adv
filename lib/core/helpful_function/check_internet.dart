

import 'dart:developer';

import 'package:http/http.dart' as http;

Future<bool> checkInternet() async {
  log('Checking Internet');

  try {
    final response = await http
        .get(Uri.parse('https://www.google.com/generate_204'))
        .timeout(const Duration(seconds: 5));

    log('Internet check status: ${response.statusCode}');
    return true;
  } catch (e) {
    log('Internet check failed: $e');
    return false;
  }
}


/*import 'dart:developer';
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
}*/
