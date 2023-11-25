import 'package:benvoice/Constant/text_style.dart';
import 'package:benvoice/View/Widget/elevated_button.dart';
import 'package:benvoice/View/Widget/s_f_circular_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class YearlyReportScreen extends StatefulWidget {
  const YearlyReportScreen({super.key});

  @override
  State<YearlyReportScreen> createState() => _YearlyReportScreenState();
}

class _YearlyReportScreenState extends State<YearlyReportScreen> {
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
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 11.h),
              child: Text(
                "2023",
                style: FontTextStyle.w400Style(
                  color: Colors.black,
                  fontSize: 29.sp,
                ),
              ),
            ),
            ChartUtils.createDoughnutChart(data, _tooltip),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 12,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 10.w,
                mainAxisSpacing: 10.h,
                childAspectRatio: 1,
              ),
              itemBuilder: (context, index) {
                return Container(
                  height: 70.sp,
                  width: 70.sp,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: const Color(0xffD9D9D9),
                    borderRadius: BorderRadius.circular(5.sp),
                  ),
                  child: ChartUtils.smallDoughnutChart(data, _tooltip),
                );
              },
            ),
            SizedBox(height: 21.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CommonElevatedButton(
                  onTap: () {},
                  title: "דיווח",
                  height: 62.h,
                  width: 139.w,
                ),
                CommonElevatedButton(
                  onTap: () {},
                  title: "סנכרון",
                  height: 62.h,
                  width: 158.w,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
