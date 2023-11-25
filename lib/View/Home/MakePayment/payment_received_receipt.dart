import 'package:benvoice/Constant/colors.dart';
import 'package:benvoice/Constant/decoration.dart';
import 'package:benvoice/Constant/image_path.dart';
import 'package:benvoice/Constant/text_style.dart';
import 'package:benvoice/View/Home/home_page/home_page.dart';
import 'package:benvoice/View/Widget/elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PaymentReceivedReceiptScreen extends StatefulWidget {
  const PaymentReceivedReceiptScreen({super.key});

  @override
  State<PaymentReceivedReceiptScreen> createState() => _PaymentReceivedReceiptScreenState();
}

class _PaymentReceivedReceiptScreenState extends State<PaymentReceivedReceiptScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        clipBehavior: Clip.antiAlias,
        decoration: BackgroundColorContainer.kLinearGradient(),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 75.h),
              Image.asset(
                ImagePath.paymentHeader,
                height: 100.sp,
                width: 100.sp,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 20.h),
              Text(
                "תשלום התקבל!",
                style: FontTextStyle.w700Style(
                  color: PickColor.paymentBlue,
                  fontSize: 38.sp,
                ),
              ),
              SizedBox(height: 65.h),
              Container(
                width: Get.width,
                height: 210.h,
                color: PickColor.paymentBlue.withOpacity(0.1),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(
                      ImagePath.paidThankYou,
                      height: 100.h,
                      width: 100.w,
                      fit: BoxFit.cover,
                    ),
                    Text(
                      "משלם ל",
                      style: FontTextStyle.w400Style(color: Colors.black, fontSize: 25.sp),
                    ),
                    Text(
                      "קרן סיוע לאומית",
                      style: FontTextStyle.w700Style(color: Colors.black, fontSize: 30.sp),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 50.h),
              Text(
                textAlign: TextAlign.center,
                "תשלום התקבל\nבְּהַצלָחָה",
                style: FontTextStyle.w400Style(
                  color: Colors.black,
                  fontSize: 35.sp,
                ),
              ),
              SizedBox(height: 50.h),
              CommonElevatedButton(
                onTap: () {
                  Get.offAll(() => const Homepage());
                },
                backgroundColor: PickColor.paymentBlue,
                title: "בחזרה לבית",
                textStyle: FontTextStyle.w400Style(
                  color: Colors.white,
                  fontSize: 20.sp,
                ),
                height: 55.h,
                width: 175.w,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
