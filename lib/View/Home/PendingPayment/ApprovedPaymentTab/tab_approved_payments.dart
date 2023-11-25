import 'package:benvoice/Constant/image_path.dart';
import 'package:benvoice/Constant/text_style.dart';
import 'package:benvoice/Controller/approved_payments_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ApprovedPaymentsTab extends StatefulWidget {
  const ApprovedPaymentsTab({super.key});

  @override
  State<ApprovedPaymentsTab> createState() => _ApprovedPaymentsTabState();
}

class _ApprovedPaymentsTabState extends State<ApprovedPaymentsTab> {
  ApprovedPaymentController approvedPaymentController = Get.put(ApprovedPaymentController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      child: ListView.builder(
        itemCount: 100,
        itemBuilder: (context, index) {
          return GetBuilder<ApprovedPaymentController>(
            builder: (controller) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xff4F9F4E),
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
                          padding: EdgeInsets.symmetric(horizontal: 12.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "1.8.2023",
                                style: FontTextStyle.w400Style(
                                  color: Colors.black,
                                  fontSize: 26.sp,
                                ),
                              ),
                              Text(
                                "אנדרומדה אחזקות",
                                style: FontTextStyle.w400Style(
                                  color: Colors.black,
                                  fontSize: 26.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 20.w),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "₪1000",
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
                            controller.showInvoice[index] ?? false
                                ? const SizedBox()
                                : InkWell(
                                    onTap: () {
                                      controller.openInvoice(index);
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(color: const Color(0xff000000)),
                                        color: const Color(0xff979797),
                                        borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(18.sp),
                                          bottomLeft: Radius.circular(18.sp),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 12.w),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.arrow_downward,
                                              size: 15.sp,
                                            ),
                                            SizedBox(width: 10.w),
                                            Text(
                                              "הצגת חשבונית",
                                              style: FontTextStyle.w400Style(
                                                color: Colors.black,
                                                fontSize: 12.sp,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                            Container(
                              decoration: BoxDecoration(
                                color: const Color(0xff4F9F4E),
                                borderRadius: controller.showInvoice[index] ?? false
                                    ? BorderRadius.only(
                                        topLeft: Radius.circular(18.sp),
                                      )
                                    : BorderRadius.only(
                                        bottomRight: Radius.circular(18.sp),
                                        topLeft: Radius.circular(18.sp),
                                      ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 5.h),
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                      ImagePath.paymentDone,
                                      width: 20.sp,
                                      height: 20.sp,
                                      fit: BoxFit.cover,
                                    ),
                                    SizedBox(width: 10.w),
                                    Text(
                                      "שולם במזומן",
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
                        controller.showInvoice[index] ?? false
                            ? ClipRRect(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(18.sp),
                                  bottomLeft: Radius.circular(18.sp),
                                  bottomRight: Radius.circular(18.sp),
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: const Color(0xff989898),
                                    border: Border(top: BorderSide(color: Colors.black, width: 1.sp)),
                                  ),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(top: 8.h, right: 8.w, left: 8.w),
                                        child: Container(
                                          height: 228.h,
                                          decoration: BoxDecoration(
                                            color: const Color(0xffE6E6E6),
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(18.sp),
                                              bottomLeft: Radius.circular(18.sp),
                                              bottomRight: Radius.circular(18.sp),
                                            ),
                                            border: Border.all(color: Colors.black, width: 1.sp),
                                          ),
                                        ),
                                      ),
                                      Center(
                                        child: TextButton(
                                          onPressed: () {
                                            controller.closeInvoice(index);
                                          },
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.arrow_upward,
                                                size: 15.sp,
                                                color: Colors.black,
                                              ),
                                              SizedBox(width: 10.w),
                                              Text(
                                                "סגירת חשבונית",
                                                style: FontTextStyle.w400Style(
                                                  color: Colors.black,
                                                  fontSize: 12.sp,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            : const SizedBox(),
                      ],
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
