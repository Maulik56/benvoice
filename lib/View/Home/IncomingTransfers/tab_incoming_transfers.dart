import 'package:benvoice/Constant/image_path.dart';
import 'package:benvoice/Constant/text_style.dart';
import 'package:benvoice/View/Widget/s_f_circular_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class IncomingTransfersTab extends StatefulWidget {
  const IncomingTransfersTab({super.key});

  @override
  State<IncomingTransfersTab> createState() => _IncomingTransfersTabState();
}

class _IncomingTransfersTabState extends State<IncomingTransfersTab> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      child: ListView.builder(
        itemCount: 100,
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: index % 2 == 0 ? const Color(0xff9B2A90) : const Color(0xff4F9F4E),
                  borderRadius: BorderRadius.vertical(top: Radius.circular(12.sp)),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18.w),
                  child: Text(
                    "שולם",
                    style: FontTextStyle.w400Style(
                      color: Colors.white,
                      fontSize: 16.sp,
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 15.h),
                decoration: BoxDecoration(
                  color: const Color(0xffD9D9D9),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(18.sp),
                    bottomRight: Radius.circular(18.sp),
                    topRight: Radius.circular(18.sp),
                  ),
                  border: Border.all(color: Colors.black, width: 1.sp),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 15.w),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "אנדרומדה אחזקות",
                          style: FontTextStyle.w400Style(
                            color: Colors.black,
                            fontSize: 26.sp,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 22.w),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          index % 2 == 0 ? "₪1000" : "₪26580",
                          style: FontTextStyle.w400Style(
                            color: Colors.black,
                            fontSize: 46.sp,
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(
                          height: 61.sp,
                          width: 61.sp,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              SfCircularChart(
                                series: <CircularSeries>[
                                  DoughnutSeries<ChartData, String>(
                                    radius: "100%",
                                    innerRadius: "70%",
                                    dataSource: [
                                      ChartData('Completed', 3, Colors.blue),
                                      ChartData('Total', 7, Colors.grey),
                                    ],
                                    xValueMapper: (ChartData data, _) => data.category,
                                    yValueMapper: (ChartData data, _) => data.value,
                                    pointColorMapper: (ChartData data, _) => data.color,
                                  ),
                                ],
                              ),
                              Text(
                                "3/10",
                                style: FontTextStyle.w400Style(
                                  color: Colors.black,
                                  fontSize: 10.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          "תשלום",
                          style: FontTextStyle.w400Style(
                            color: Colors.black,
                            fontSize: 26.sp,
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: index % 2 == 1 ? const Color(0xff184C72) : const Color(0xff4F9F4E),
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(18.sp),
                              topLeft: Radius.circular(18.sp),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 5.h),
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  index % 2 == 1 ? ImagePath.paymentDone : ImagePath.paymentWaiting,
                                  width: 20.sp,
                                  height: 20.sp,
                                  fit: BoxFit.cover,
                                ),
                                SizedBox(width: 10.w),
                                Text(
                                  index % 2 == 1 ? "העברה התקבלה" : "העברה נשלחה",
                                  style: FontTextStyle.w400Style(
                                    color: Colors.white,
                                    fontSize: 24.sp,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
