import 'package:flutter/material.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/classes/crud.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/classes/status_class.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/app_links.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/extensions/failure_extension.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/models/product_model.dart';
import 'package:get/get.dart';

class ProductSearchController extends GetxController {
  final Crud crud;

  ProductSearchController({required this.crud});

  final TextEditingController searchController = TextEditingController();

  StatusClass status = StatusClass.init;

  List<ProductModel> products = [];

  String query = '';

  Future<void> searchProducts(String value) async {
    if (value.trim().isEmpty) {
      products.clear();
      query = '';
      status = StatusClass.init;
      update();
      return;
    }

    query = value;

    status = StatusClass.isLoading;
    update();

    final result = await crud.getData(endPoint: AppLinks.searchProducts(value));

    result.fold(
      (failure) {
        products.clear();
        status = failure.toStatusClass();

        update();
      },
      (data) {
        try {
          products = (data as List)
              .map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
              .toList();

          status = StatusClass.success;
        } catch (e) {
          status = StatusClass.getAnotherError(message: e.toString());
        }

        update();
      },
    );
  }

  void clearSearch() {
    searchController.clear();
    products.clear();
    query = '';
    status = StatusClass.init;
    update();
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }
}
