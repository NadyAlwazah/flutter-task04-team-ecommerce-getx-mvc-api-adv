import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/app_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingService {
  static Future<bool> isSeen() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(AppKeys.kOnboardingSeen) ?? false;
  }

  static Future<void> markSeen() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(AppKeys.kOnboardingSeen, true);
  }
}
