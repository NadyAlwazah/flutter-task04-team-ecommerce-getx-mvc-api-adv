import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/classes/failure.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/app_links.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/helpful_function/check_internet.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/network/server_helper.dart';
import 'package:http/http.dart' as http;

class Crud {
  ///Get Request
  Future<Either<Failure, dynamic>> getData({
    required String endPoint,
    Map<String, String>? headers,
    String? token,
  }) async {
    try {
      if (!await checkInternet()) {
        return const Left(NoInternetFailure());
      }

      final response = await http.get(
        Uri.parse('${AppLinks.baseUrl}$endPoint'),
        headers: headers ?? ServerHelper.headers(token: token),
      );

      return _processResponse(response);
    } catch (e) {
      return Left(UnknownFailure(message: e.toString()));
    }
  }

  //Post Request
  Future<Either<Failure, dynamic>> postData({
    required String endPoint,
    required Map<String, dynamic> body,
    Map<String, String>? headers,
    String? token,
  }) async {
    try {
      if (!await checkInternet()) {
        return const Left(NoInternetFailure());
      }

      final response = await http.post(
        Uri.parse('${AppLinks.baseUrl}$endPoint'),
        headers: headers ?? ServerHelper.headers(token: token),
        body: jsonEncode(body),
      );

      return _processResponse(response);
    } catch (e) {
      return Left(UnknownFailure(message: e.toString()));
    }
  }

  // Delete Request
  Future<Either<Failure, dynamic>> deleteData({
    required String endPoint,
    Map<String, String>? headers,
    String? token,
  }) async {
    try {
      if (!await checkInternet()) {
        return const Left(NoInternetFailure());
      }

      final response = await http.delete(
        Uri.parse('${AppLinks.baseUrl}$endPoint'),
        headers: headers ?? ServerHelper.headers(token: token),
      );

      return _processResponse(response);
    } catch (e) {
      return Left(UnknownFailure(message: e.toString()));
    }
  }

  Either<Failure, dynamic> _processResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
      case 201:
        return Right(jsonDecode(response.body));

      case 204:
        return const Right(null);

      case 400:
        return const Left(BadRequestFailure());

      case 401:
      case 403:
        return const Left(UnauthorizedFailure());

      case 404:
        return const Left(NoDataFailure());

      case 500:
      case 501:
      case 502:
      case 503:
        return const Left(ServerFailure());

      default:
        try {
          final data = jsonDecode(response.body);

          return Left(
            UnknownFailure(message: data['message'] ?? 'Unknown Error'),
          );
        } catch (_) {
          return const Left(ServerFailure());
        }
    }
  }
}
