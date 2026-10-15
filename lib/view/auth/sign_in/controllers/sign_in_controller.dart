import 'package:flutter/material.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/classes/crud.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/classes/failure.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/app_links.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/routes/app_routes.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/services/auth_service.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/models/auth_tokens_model.dart';
import 'package:get/get.dart';

class SignInController extends GetxController {
  final Crud _crud = Get.find<Crud>();
  final AuthService _authService = Get.find<AuthService>();

  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final isPasswordHidden = true.obs;
  final isLoading = false.obs;

  void togglePasswordVisibility() => isPasswordHidden.toggle();

  Future<void> onSignIn() async {
    if (isLoading.value) return;
    if (!(formKey.currentState?.validate() ?? false)) return;

    FocusManager.instance.primaryFocus?.unfocus();
    isLoading.value = true;

    try {
      final result = await _crud.postData(
        endPoint: AppLinks.login,
        body: {
          'email': emailController.text.trim(),
          'password': passwordController.text,
        },
      );

      await result.fold(
        (failure) async => _showError(_messageFor(failure)),
        (data) => _onLoginSuccess(data),
      );
    } catch (_) {
      _showError('Something went wrong, please try again');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> _onLoginSuccess(dynamic data) async {
    final tokens = AuthTokensModel.fromJson(data as Map<String, dynamic>);

    if (tokens.accessToken.isEmpty) {
      _showError('Something went wrong, please try again');
      return;
    }

    await _authService.saveTokens(
      accessToken: tokens.accessToken,
      refreshToken: tokens.refreshToken,
    );
    Get.offAllNamed(AppRoutes.kHome);
  }

  String _messageFor(Failure failure) {
    if (failure is NoInternetFailure) return 'No internet connection';
    if (failure is UnauthorizedFailure) return 'Invalid email or password';
    if (failure is BadRequestFailure) return 'Please check your inputs';
    if (failure is ServerFailure) return 'Server error, try again later';
    return 'Something went wrong, please try again';
  }

  void _showError(String message) {
    Get.snackbar(
      'Sign in failed',
      message,
      backgroundColor: Colors.redAccent,
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(16),
    );
  }

  void onAppleTap() {}

  void onGoogleTap() {}

  void onFacebookTap() {}

  void goToForgotPassword() => Get.toNamed(AppRoutes.kForgotPassword);

  void goToSignUp() => Get.toNamed(AppRoutes.kSignup);
}
