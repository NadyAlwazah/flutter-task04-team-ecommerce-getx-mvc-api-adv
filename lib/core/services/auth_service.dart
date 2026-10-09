import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/app_keys.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/services/shared_preferences_helper.dart';
import 'package:get/get.dart';

class AuthService extends GetxService {
  Future<void> saveTokens({
    required String accessToken,
    required String refreshToken,
  }) async {
    await SharedPreferencesHelper.saveString(AppKeys.kAccessToken, accessToken);

    await SharedPreferencesHelper.saveString(
      AppKeys.kRefreshToken,
      refreshToken,
    );
  }

  Future<String?> getAccessToken() async {
    return await SharedPreferencesHelper.getString(AppKeys.kAccessToken);
  }

  Future<String?> getRefreshToken() async {
    return await SharedPreferencesHelper.getString(AppKeys.kRefreshToken);
  }

  Future<bool> isLoggedIn() async {
    final token = await getAccessToken();
    return token != null && token.isNotEmpty;
  }

  Future<void> logout() async {
    await SharedPreferencesHelper.remove(AppKeys.kAccessToken);

    await SharedPreferencesHelper.remove(AppKeys.kRefreshToken);
  }
}
