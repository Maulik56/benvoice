import 'dart:developer';

import 'package:benvoice/Constant/colors.dart';
import 'package:benvoice/Constant/decoration.dart';
import 'package:benvoice/Constant/image_path.dart';
import 'package:benvoice/Constant/text_style.dart';
import 'package:benvoice/View/Home/MakePayment/credit_card_payment.dart';
import 'package:benvoice/View/Home/MakePayment/payment_received_receipt.dart';
import 'package:benvoice/View/Widget/elevated_button.dart';
import 'package:benvoice/View/Widget/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class NewPaymentScreen extends StatefulWidget {
  const NewPaymentScreen({super.key});

  @override
  State<NewPaymentScreen> createState() => _NewPaymentScreenState();
}

class _NewPaymentScreenState extends State<NewPaymentScreen> {
  int selectedPaymentMethod = 0;

  TextEditingController controller = TextEditingController();

  void handleRadioValueChanged(int? value) {
    setState(() {
      selectedPaymentMethod = value!;
    });
  }

  void handlePayment() {
    log("Processing payment for method: $selectedPaymentMethod");
    if (selectedPaymentMethod == 1 || selectedPaymentMethod == 0) {
      Get.off(() => const CreditCardPaymentScreen());
    } else if (selectedPaymentMethod == 2) {
      Get.off(() => const PaymentReceivedReceiptScreen());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        clipBehavior: Clip.antiAlias,
        decoration: BackgroundColorContainer.kLinearGradient(),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
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
                  "שער תשלום",
                  style: FontTextStyle.w700Style(
                    color: PickColor.paymentBlue,
                    fontSize: 38.sp,
                  ),
                ),
                SizedBox(height: 20.h),
                ListTile(
                  title: Text(
                    "הסכום הכולל לתשלום",
                    style: FontTextStyle.w400Style(
                      color: Colors.black,
                      fontSize: 28.sp,
                    ),
                  ),
                  trailing: Text(
                    "₪ 120",
                    style: FontTextStyle.w700Style(
                      color: Colors.black,
                      fontSize: 28.sp,
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "אפשרויות תשלום",
                    style: FontTextStyle.w400Style(
                      color: PickColor.paymentBlue,
                      fontSize: 28.sp,
                    ),
                  ),
                ),
                ListTile(
                  leading: Radio(
                    value: 0,
                    groupValue: selectedPaymentMethod,
                    onChanged: handleRadioValueChanged,
                  ),
                  title: const Text("כרטיס חיוב"),
                ),
                ListTile(
                  leading: Radio(
                    value: 1,
                    groupValue: selectedPaymentMethod,
                    onChanged: handleRadioValueChanged,
                  ),
                  title: const Text("כרטיס אשראי"),
                ),
                ListTile(
                  leading: Radio(
                    value: 2,
                    groupValue: selectedPaymentMethod,
                    onChanged: handleRadioValueChanged,
                  ),
                  title: const Text("בנקאות נטו"),
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "הכנס את",
                        style: FontTextStyle.w400Style(
                          color: Colors.black,
                          fontSize: 20.sp,
                        ),
                      ),
                      TextSpan(
                        text: "כתובת לתשלום וירטואלי (vpa) ",
                        style: FontTextStyle.w400Style(
                          color: PickColor.paymentBlue,
                          fontSize: 20.sp,
                        ),
                      ),
                    ],
                  ),
                ),
                CommonTextFormField(
                  controller: controller,
                  hintText: "היכנס כאן",
                  label: "",
                  width: 309.w,
                  height: 47.h,
                ),
                SizedBox(height: 20.h),
                Text(
                  "vpa היא כתובת ייחודית לתשלום שניתן לקשר לחשבון הבנק של אדם לביצוע תשלומים.",
                  style: FontTextStyle.w400Style(
                    color: Colors.black,
                    fontSize: 14.sp,
                  ),
                ),
                SizedBox(height: 20.h),
                CommonElevatedButton(
                  onTap: () {
                    handlePayment();
                  },
                  backgroundColor: PickColor.paymentBlue,
                  title: "שלם עכשיו",
                  textStyle: FontTextStyle.w400Style(
                    color: Colors.white,
                    fontSize: 20.sp,
                  ),
                  height: 55.h,
                  width: 175.w,
                ),
                SizedBox(height: 30.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
