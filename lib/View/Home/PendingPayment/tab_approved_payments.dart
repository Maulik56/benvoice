import 'package:benvoice/Constant/image_path.dart';
import 'package:benvoice/Constant/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ApprovedPaymentsTab extends StatefulWidget {
  const ApprovedPaymentsTab({super.key});

  @override
  State<ApprovedPaymentsTab> createState() => _ApprovedPaymentsTabState();
}

class _ApprovedPaymentsTabState extends State<ApprovedPaymentsTab> {
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
                        Container(
                          decoration: BoxDecoration(
                            color: const Color(0xff989898),
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(18.sp),
                              topRight: Radius.circular(18.sp),
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
                        Container(
                          decoration: BoxDecoration(
                            color: const Color(0xff4F9F4E),
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
