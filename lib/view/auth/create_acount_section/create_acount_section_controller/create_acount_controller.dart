import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/classes/crud.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/classes/status_class.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/app_links.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/routes/app_routes.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/models/user_model.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  final Crud crud;

  RegisterController(this.crud);

  StatusClass status = StatusClass.init;
  String? errorMessage;

  Future<void> register({
    required String name,
    required String email,
    required String password,
    required String avatar,
  }) async {
    if (status == StatusClass.isLoading) return;
    status = StatusClass.isLoading;
    update();

    final register = UserModel(
      email: email,
      password: password,
      name: name,
      avatar: avatar,
    );

    final result = await crud.postData(
      endPoint: "${AppLinks.signUp}",

      body: register.toJson(),
    );

    result.fold(
      (failure) {
        status = failure as StatusClass;
        errorMessage = status.message;

        update();
        print('rigister errrrror');

        Get.snackbar('register Failed', errorMessage!);
      },
      (response) {
        status = StatusClass.success;

        update();
        print('register SUCCESS');
        print('Navigating to: home}');
        Get.snackbar('تم انشاء الحساب بنجاح ', "");
        Get.offAllNamed(AppRoutes.kSignin);
      },
    );
  }
}
