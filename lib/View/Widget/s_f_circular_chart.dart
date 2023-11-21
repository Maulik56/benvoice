import 'package:benvoice/Constant/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartData {
  final String category;
  final double value;
  final Color color;

  ChartData(this.category, this.value, this.color);
}

class ChartUtils {
  static List<ChartData> getChartData() {
    return [
      ChartData('Category A', 35, const Color.fromRGBO(106, 90, 205, 1)),
      ChartData('Category B', 28, const Color.fromRGBO(0, 168, 181, 1)),
      ChartData('Category C', 34, const Color.fromRGBO(46, 204, 113, 1)),
      ChartData('Category D', 32, const Color.fromRGBO(241, 196, 15, 1)),
      ChartData('Category E', 40, const Color.fromRGBO(231, 76, 60, 1)),
    ];
  }

  static Widget createDoughnutChart(List<ChartData> data, TooltipBehavior tooltip) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SfCircularChart(
          tooltipBehavior: tooltip,
          series: <DoughnutSeries<ChartData, String>>[
            DoughnutSeries<ChartData, String>(
              innerRadius: '80%',
              radius: '87%',
              dataSource: data,
              xValueMapper: (ChartData data, _) => data.category,
              yValueMapper: (ChartData data, _) => data.value,
              pointColorMapper: (ChartData data, _) => data.color,
              dataLabelSettings: const DataLabelSettings(
                isVisible: true,
                labelPosition: ChartDataLabelPosition.outside,
                connectorLineSettings: ConnectorLineSettings(
                  length: '5%',
                  color: Colors.grey,
                  width: 2,
                ),
              ),
            ),
          ],
        ),
        Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: Get.width / 3.8),
              child: Text(
                "הכנסות",
                style: FontTextStyle.w700Style(
                  color: const Color(0xff4F9F4E),
                  fontSize: 14.sp,
                ),
              ),
            ),
            Text(
              "₪8,613,365,248",
              style: FontTextStyle.w700Style(
                color: const Color(0xff4F9F4E),
                fontSize: 20.sp,
              ),
            ),
            Text(
              "₪8,613,365,248",
              style: FontTextStyle.w700Style(
                color: const Color(0xff9B2A90),
                fontSize: 20.sp,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: Get.width / 3.8),
              child: Text(
                "הוצאות",
                style: FontTextStyle.w700Style(
                  color: const Color(0xff9B2A90),
                  fontSize: 14.sp,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  static Widget smallDoughnutChart(List<ChartData> data, TooltipBehavior tooltip) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SfCircularChart(
          tooltipBehavior: tooltip,
          series: <DoughnutSeries<ChartData, String>>[
            DoughnutSeries<ChartData, String>(
              innerRadius: '80%',
              radius: '87%',
              dataSource: data,
              xValueMapper: (ChartData data, _) => data.category,
              yValueMapper: (ChartData data, _) => data.value,
              pointColorMapper: (ChartData data, _) => data.color,
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "יולי",
              style: FontTextStyle.w400Style(
                color: const Color(0xff535353),
                fontSize: 10.sp,
              ),
            ),
            Text(
              "₪230m",
              style: FontTextStyle.w700Style(
                color: const Color(0xff4F9F4E),
                fontSize: 10.sp,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
