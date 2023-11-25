import 'package:benvoice/Constant/image_path.dart';
import 'package:benvoice/Constant/text_style.dart';
import 'package:benvoice/Controller/PaymentTransactionsController.dart';
import 'package:benvoice/View/Widget/s_f_circular_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class PaymentTransactionsTab extends StatefulWidget {
  const PaymentTransactionsTab({super.key});

  @override
  State<PaymentTransactionsTab> createState() => _PaymentTransactionsTabState();
}

class _PaymentTransactionsTabState extends State<PaymentTransactionsTab> {
  PaymentTransferController paymentTransferController = Get.put(PaymentTransferController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 7.w),
      child: ListView.builder(
        itemCount: 100,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xffD9D9D9),
                  borderRadius: BorderRadius.circular(12.sp),
                  border: Border.all(color: Colors.black, width: 1.sp),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "אילון מאסק",
                          style: FontTextStyle.w400Style(
                            color: Colors.black,
                            fontSize: 22.sp,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "נותר:",
                              style: FontTextStyle.w400Style(
                                color: Colors.black,
                                fontSize: 18.sp,
                              ),
                            ),
                            Text(
                              "₪15328",
                              style: FontTextStyle.w400Style(
                                color: Colors.black,
                                fontSize: 22.sp,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "נותר:",
                              style: FontTextStyle.w400Style(
                                color: Colors.black,
                                fontSize: 18.sp,
                              ),
                            ),
                            Text(
                              "₪15328",
                              style: FontTextStyle.w400Style(
                                color: Colors.black,
                                fontSize: 22.sp,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                        GetBuilder<PaymentTransferController>(
                          builder: (controller) {
                            return controller.showInvoice[index] ?? false
                                ? SizedBox()
                                : InkWell(
                                    onTap: () {
                                      controller.openInvoice(index);
                                    },
                                    child: Container(
                                      height: 35.sp,
                                      width: 69.sp,
                                      decoration: BoxDecoration(
                                        color: const Color(0xffE3E3E3),
                                        borderRadius: BorderRadius.vertical(top: Radius.circular(18.sp)),
                                        border: Border.all(color: Colors.black, width: 1.sp),
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          SvgPicture.asset(
                                            ImagePath.downArrow,
                                            height: 15.h,
                                            width: 9.w,
                                            fit: BoxFit.cover,
                                          ),
                                          Text(
                                            "מע”מ",
                                            style: FontTextStyle.w400Style(
                                              color: Colors.black,
                                              fontSize: 12.sp,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                          },
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "סכום כולל מע”מ:",
                              style: FontTextStyle.w400Style(
                                color: Colors.black,
                                fontSize: 18.sp,
                              ),
                            ),
                            Text(
                              "₪15328",
                              style: FontTextStyle.w400Style(
                                color: Colors.black,
                                fontSize: 22.sp,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              GetBuilder<PaymentTransferController>(
                builder: (controller) {
                  return controller.showInvoice[index] ?? false
                      ? Container(
                          width: 165.w,
                          height: 44.h,
                          margin: EdgeInsets.only(bottom: 15.h),
                          decoration: BoxDecoration(
                            border: Border.all(color: Color(0xff000000)),
                            color: Color(0xffe3e3e3),
                            borderRadius: BorderRadius.vertical(bottom: Radius.circular(18.sp)),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              IconButton(
                                onPressed: () {
                                  controller.closeInvoice(index);
                                },
                                icon: SvgPicture.asset(
                                  ImagePath.upwardArrow,
                                  width: 9.w,
                                  height: 15.h,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    "נותר:",
                                    style: FontTextStyle.w400Style(
                                      color: Colors.black,
                                      fontSize: 9.sp,
                                    ),
                                  ),
                                  Text(
                                    "₪15328",
                                    style: FontTextStyle.w400Style(
                                      color: Colors.black,
                                      fontSize: 15.sp,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    "נותר:",
                                    style: FontTextStyle.w400Style(
                                      color: Colors.black,
                                      fontSize: 9.sp,
                                    ),
                                  ),
                                  Text(
                                    "₪15328",
                                    style: FontTextStyle.w400Style(
                                      color: Colors.black,
                                      fontSize: 15.sp,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      : SizedBox(height: 15.h);
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
