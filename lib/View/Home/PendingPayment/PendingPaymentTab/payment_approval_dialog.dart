import 'package:benvoice/Constant/text_style.dart';
import 'package:benvoice/View/Widget/elevated_button.dart';
import 'package:benvoice/View/Widget/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

Future<dynamic> paymentApprovalDialog() {
  TextEditingController invoiceController = TextEditingController();
  TextEditingController forController = TextEditingController();
  TextEditingController detailController = TextEditingController();
  TextEditingController sumController = TextEditingController();

  return Get.dialog(
    Dialog(
      backgroundColor: const Color(0xffD9D9D9),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
        side: const BorderSide(color: Colors.black, width: 1),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 11.h, horizontal: 18.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "אישור תשלום",
              style: FontTextStyle.w400Style(
                color: Colors.black,
                fontSize: 38.sp,
              ),
            ),
            CommonTextFormField(
              controller: invoiceController,
              hintText: "023546",
              label: "חשבונית מס’",
              width: 309.w,
              height: 47.h,
            ),
            CommonTextFormField(
              controller: forController,
              hintText: "יעקב חומרי בניין",
              label: "עבור:",
              width: 309.w,
              height: 47.h,
            ),
            CommonTextFormField(
              controller: detailController,
              hintText: "דלי צ",
              label: "פירוט:",
              width: 309.w,
              height: 157.h,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "₪",
                  style: FontTextStyle.w400Style(
                    color: Colors.black,
                    fontSize: 46.sp,
                  ),
                ),
                CommonTextFormField(
                  controller: sumController,
                  hintText: "2765",
                  label: "סכום:",
                  width: 125.w,
                  height: 62.h,
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h),
              child: Text(
                "תשלום באמצעות:",
                style: FontTextStyle.w400Style(
                  color: Colors.black,
                  fontSize: 28.sp,
                ),
              ),
            ),
            CommonElevatedButton(
              onTap: () => Get.back(),
              title: "העברה בנקאית",
              height: 42.h,
              width: 199.w,
              textStyle: FontTextStyle.w400Style(
                color: Colors.black,
                fontSize: 16.sp,
              ),
            ),
            SizedBox(height: 10.h),
            CommonElevatedButton(
              onTap: () => Get.back(),
              title: "כרטיס אשראי",
              height: 42.h,
              width: 191.w,
              textStyle: FontTextStyle.w400Style(
                color: Colors.black,
                fontSize: 16.sp,
              ),
            ),
            SizedBox(height: 10.h),
            CommonElevatedButton(
              onTap: () => Get.back(),
              title: "שולם במזומן",
              height: 42.h,
              width: 186.w,
              textStyle: FontTextStyle.w400Style(
                color: Colors.black,
                fontSize: 16.sp,
              ),
            ),
          ],
        ),
      ),
    ),
    barrierDismissible: true,
    transitionDuration: const Duration(milliseconds: 300),
    transitionCurve: Curves.easeOut,
  );
}
