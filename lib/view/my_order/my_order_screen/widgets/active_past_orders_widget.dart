import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/app_colors.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/styles.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/routes/app_routes.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/my_order/controllers/my_order_controller.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/my_order/models/fake_data.dart';
import 'package:get/get.dart';

class ActivePastOrdersWidget extends StatefulWidget {
  ActivePastOrdersWidget({super.key});
  final controller = Get.find<MyOrderController>();
  @override
  State<ActivePastOrdersWidget> createState() => _ActivePastOrdersWidgetState();
}

class _ActivePastOrdersWidgetState extends State<ActivePastOrdersWidget> {
  @override
  Widget build(BuildContext context) {
    final activeOrder = OrdersFakeData.activeOrders.length;
    final pastOrder = OrdersFakeData.pastOrders.length;
    return Container(
      constraints: BoxConstraints(minWidth: 358.w),
      height: 48,
      decoration: BoxDecoration(
        color: AppColors.backgroundItem,
        borderRadius: BorderRadius.circular(99),
        border: Border.all(width: 1, color: AppColors.containerBoarderColor),
      ),
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Obx(() {
          final isActivity = widget.controller.selectedTab.value == 'activity';

          return Row(
            children: [
              GestureDetector(
                onTap: () => widget.controller.changeTab('activity'),
                child: Container(
                  width: 160.w,
                  height: 40.h,
                  decoration: BoxDecoration(
                    color: isActivity
                        ? AppColors.primary
                        : AppColors.backgroundItem,
                    borderRadius: BorderRadius.circular(999),
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 6,
                      children: [
                        Text(
                          'Active Orders',
                          style: Styles.textStyle12W500PlusJakartaSans.copyWith(
                            color: Colors.white,
                          ),
                        ),
                        Container(
                          width: 17.w,
                          height: 22.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(999),
                            color: Colors.transparent.withOpacity(0.25),
                          ),
                          child: Center(
                            child: Text(
                              '${activeOrder}',
                              style: TextStyle(
                                color: !isActivity
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  widget.controller.changeTab('past');
                  Get.toNamed(AppRoutes.kPastOrders)?.then((_) {
                    widget.controller.resetTab();
                  });
                },
                child: Container(
                  width: 168.w,
                  height: 38.h,
                  decoration: BoxDecoration(
                    color: !isActivity
                        ? AppColors.primary
                        : AppColors.backgroundItem,
                    borderRadius: BorderRadius.circular(999),
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 6,
                      children: [
                        Text(
                          'Past Orders',
                          style: Styles.textStyle12W500PlusJakartaSans.copyWith(
                            color: AppColors.secondTextColor,
                          ),
                        ),

                        Container(
                          width: 17.w,
                          height: 22.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(999),
                            color: AppColors.backgroundNumberColor,
                          ),
                          child: Center(
                            child: Text(
                              '${pastOrder}',
                              style: Styles.textStyle10W600PlusJakartaSans
                                  .copyWith(color: AppColors.secondTextColor),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
