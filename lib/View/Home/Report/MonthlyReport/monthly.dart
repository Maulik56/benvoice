import 'package:benvoice/Constant/text_style.dart';
import 'package:benvoice/View/Home/IncomingTransfers/incoming_transfers.dart';
import 'package:benvoice/View/Home/PendingPayment/pending_payment.dart';
import 'package:benvoice/View/Home/Report/MonthlyReport/payment_link_dialog.dart';
import 'package:benvoice/View/Widget/elevated_button.dart';
import 'package:benvoice/View/Widget/s_f_circular_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class MonthlyReportScreen extends StatefulWidget {
  const MonthlyReportScreen({super.key});

  @override
  State<MonthlyReportScreen> createState() => _MonthlyReportScreenState();
}

class _MonthlyReportScreenState extends State<MonthlyReportScreen> {
  late List<ChartData> data;
  late TooltipBehavior _tooltip;

  @override
  void initState() {
    super.initState();
    data = ChartUtils.getChartData();
    _tooltip = TooltipBehavior(enable: true);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ChartUtils.createDoughnutChart(data, _tooltip),
          SizedBox(height: 18.h),
          CommonElevatedButton(
            onTap: () {
              Get.to(
                () => const IncomingTransfersScreen(),
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeOut,
                transition: Transition.rightToLeft,
              );
            },
            backgroundColor: const Color(0xFF4F9F4E),
            title: "הכנסות",
            textStyle: FontTextStyle.w400Style(
              color: Colors.white,
              fontSize: 38.sp,
            ),
            height: 72.h,
            width: 322.w,
          ),
          SizedBox(height: 18.h),
          CommonElevatedButton(
            onTap: () {
              Get.to(
                () => const PendingPaymentScreen(),
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeOut,
                transition: Transition.cupertino,
              );
            },
            backgroundColor: const Color(0xFF9B2A8F),
            title: "הוצאות",
            textStyle: FontTextStyle.w400Style(
              color: Colors.white,
              fontSize: 38.sp,
            ),
            height: 72.h,
            width: 322.w,
          ),
          SizedBox(height: 18.h),
          CommonElevatedButton(
            onTap: () {
              Get.dialog(
                Dialog(
                  backgroundColor: Colors.white,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CommonElevatedButton(
                        onTap: () => Get.back(),
                        title: "Back",
                        height: 62.h,
                        width: 139.w,
                      ),
                    ],
                  ),
                ),
                transitionDuration: Duration.zero,
              );
            },
            title: "סריקת חשבונית",
            textStyle: FontTextStyle.w400Style(
              color: Colors.black,
              fontSize: 38.sp,
            ),
            height: 72.h,
            width: 322.w,
          ),
          SizedBox(height: 18.h),
          CommonElevatedButton(
            onTap: () => paymentLinkDialogBox(),
            textStyle: FontTextStyle.w400Style(
              color: Colors.black,
              fontSize: 38.sp,
            ),
            height: 72.h,
            width: 322.w,
            title: 'תשלום חדש',
          ),
        ],
      ),
    );
  }
}
