import 'package:benvoice/View/Home/IncomingTransfers/incoming_transfers.dart';
import 'package:benvoice/View/Home/PendingPayment/pending_payment.dart';
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
          CommonElevatedButton(
            onPressed: () {
              Get.to(
                () => const IncomingTransfersScreen(),
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeOut,
                transition: Transition.rightToLeft,
              );
            },
            backgroundColor: Colors.green,
            title: "הכנסות",
            titleColor: Colors.white,
          ),
          CommonElevatedButton(
            onPressed: () {
              Get.to(
                () => const PendingPaymentScreen(),
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeOut,
                transition: Transition.cupertino,
              );
            },
            backgroundColor: const Color(0xff9B2A90),
            title: "הוצאות",
            titleColor: Colors.white,
          ),
          CommonElevatedButton(
            onPressed: () {
              Get.dialog(
                Dialog(
                  backgroundColor: Colors.white,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SmallElevatedButton(
                        onPressed: () => Get.back(),
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
            backgroundColor: const Color(0xFFD9D9D9),
            title: "סריקת חשבונית",
            titleColor: Colors.black,
          ),
          CommonElevatedButton(
            onPressed: () {
              Get.dialog(
                Dialog(
                  backgroundColor: Colors.white,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SmallElevatedButton(
                        onPressed: () => Get.back(),
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
            backgroundColor: const Color(0xFFD9D9D9),
            title: "תשלום חדש",
            titleColor: Colors.black,
          ),
        ],
      ),
    );
  }
}
