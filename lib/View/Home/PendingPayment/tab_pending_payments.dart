import 'package:benvoice/Constant/text_style.dart';
import 'package:benvoice/View/Widget/elevated_button.dart';
import 'package:benvoice/demoDialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PendingPaymentsTab extends StatefulWidget {
  const PendingPaymentsTab({super.key});

  @override
  State<PendingPaymentsTab> createState() => _PendingPaymentsTabState();
}

class _PendingPaymentsTabState extends State<PendingPaymentsTab> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: 100,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(bottom: 15.h),
                decoration: BoxDecoration(
                  color: const Color(0xffD9D9D9),
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(color: Colors.black, width: 1.sp),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 9.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.h),
                        child: Column(
                          children: [
                            ElevatedButton(
                              onPressed: () => DemoDialog(),
                              style: buildElevatedButtonStyle(const Color(0xFF4F9F4E)),
                              child: const Text("אישור"),
                            ),
                            SizedBox(height: 15.h),
                            ElevatedButton(
                              onPressed: () {},
                              style: buildElevatedButtonStyle(const Color(0xff9B2A90)),
                              child: const Text("סירוב"),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: const Color(0xff989898),
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.vertical(top: Radius.circular(18.sp)),
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
                      Column(
                        children: [
                          Text(
                            "יעקב חומרי בניין",
                            style: FontTextStyle.w700Style(
                              color: Colors.black,
                              fontSize: 16.sp,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 7.h),
                            child: Text(
                              "₪3853",
                              style: FontTextStyle.w400Style(
                                color: Colors.black,
                                fontSize: 16.sp,
                              ),
                            ),
                          ),
                          Text(
                            "ציוד משרדי",
                            style: FontTextStyle.w400Style(
                              color: Colors.black,
                              fontSize: 16.sp,
                            ),
                          ),
                          SizedBox(height: 16.h),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        Container(
          width: Get.width,
          decoration: const BoxDecoration(
            color: Color.fromRGBO(99, 99, 99, 0.29),
            border: Border(
              top: BorderSide(color: Colors.black, width: 1),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h),
            child: Column(
              children: [
                SizedBox(
                  width: 285.w,
                  child: CommonElevatedButton(
                    onPressed: () {},
                    title: "סריקת חשבונית",
                    titleColor: Colors.black,
                    backgroundColor: Color(0xffD9D9D9),
                  ),
                ),
                SizedBox(
                  width: 285.w,
                  child: CommonElevatedButton(
                    onPressed: () {},
                    title: "תשלום חדש",
                    titleColor: Colors.black,
                    backgroundColor: Color(0xffD9D9D9),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  ButtonStyle buildElevatedButtonStyle(Color color) {
    return ElevatedButton.styleFrom(
      primary: color,
      onPrimary: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
        side: const BorderSide(color: Colors.black, width: 1),
      ),
      fixedSize: Size(67.w, 44.h),
    );
  }
}
