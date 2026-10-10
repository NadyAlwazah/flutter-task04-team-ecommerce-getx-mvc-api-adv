import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/classes/crud.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/classes/status_class.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/app_links.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/extensions/failure_extension.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/models/category_model.dart';
import 'package:get/get.dart';

class CategoriesController extends GetxController {
  CategoriesController({required this.crud});

  final Crud crud;

  List<CategoryModel> categories = [];

  int selectedIndex = 0;

  StatusClass status = StatusClass.init;

  Future<void> getCategories() async {
    status = StatusClass.isLoading;
    update();

    final result = await crud.getData(endPoint: AppLinks.categories);

    result.fold(
      (failure) {
        status = failure.toStatusClass();
        update();
      },
      (data) {
        categories = List<CategoryModel>.from(
          data.map((e) => CategoryModel.fromJson(e)),
        );

        status = StatusClass.success;

        update();
      },
    );
  }

  void changeCategory(int index) {
    selectedIndex = index;
    update();
  }

  @override
  void onInit() {
    getCategories();
    super.onInit();
  }
}
