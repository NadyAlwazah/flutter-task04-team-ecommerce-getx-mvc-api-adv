import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/bindings/initialized_binding.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/app_colors.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/routes/app_pages.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/routes/app_routes.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const ModernStore());
}

class ModernStore extends StatelessWidget {
  const ModernStore({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(scaffoldBackgroundColor: AppColors.backgroundColor),
        initialBinding: InitializeBinding(),
        initialRoute: AppRoutes.kHome,
        getPages: AppPages.getPages,
      ),
    );
  }
}
