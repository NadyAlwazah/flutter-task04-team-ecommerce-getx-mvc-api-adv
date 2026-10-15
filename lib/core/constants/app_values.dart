import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_size.dart';

class AppValues {
  AppValues._();

  static EdgeInsets screenPadding = EdgeInsets.symmetric(
    horizontal: AppSize.s20.w,
    vertical: AppSize.s12.h,
  );
}
