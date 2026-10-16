import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/classes/crud.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/classes/status_class.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/app_links.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/extensions/failure_extension.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/models/product_model.dart';
import 'package:get/get.dart';

class ProductsController extends GetxController {
  ProductsController({required this.crud});

  final Crud crud;

  List<ProductModel> allProducts = [];
  List<ProductModel> products = [];

  StatusClass status = StatusClass.init;

  int? selectedCategoryId;

  @override
  void onInit() {
    getProducts();
    super.onInit();
  }

  Future<void> getProducts() async {
    status = StatusClass.isLoading;
    update();

    final result = await crud.getData(endPoint: AppLinks.products);
print('PRODUCTS API RESULT: $result');
    result.fold(
      (failure) {
        status = failure.toStatusClass();
        update();
      },
      (data) {
        try {
          allProducts = (data as List)
              .map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
              .toList();

          _applyFilter();

          //!!
        } catch (e) {
          status = StatusClass.getAnotherError(message: e.toString());

          update();
        }
      },
    );
  }

  void filterByCategory(int? categoryId) {
    selectedCategoryId = categoryId;
    _applyFilter();
  }

  void _applyFilter() {
    products = selectedCategoryId == null
        ? List.from(allProducts)
        : allProducts
              .where((product) => product.category.id == selectedCategoryId)
              .toList();

    status = StatusClass.success;

    update();
  }
}
