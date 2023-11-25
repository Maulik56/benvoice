import 'package:benvoice/Constant/image_path.dart';
import 'package:benvoice/Constant/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

Future<dynamic> paymentLinkDialogBox() {
  Map<String, List<String>> shareWith = {
    "images": [
      ImagePath.copy,
      ImagePath.sms,
      ImagePath.whatsapp,
      ImagePath.message,
    ],
    "title": [
      "העתק",
      "אימייל",
      "ווטסאפ",
      "SMS",
    ],
  };

  return Get.dialog(
    Dialog(
      backgroundColor: const Color(0xffD9D9D9),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
        side: const BorderSide(color: Colors.black, width: 1),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 38.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(ImagePath.qrCode),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 33.h),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xff989898),
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(
                    color: Colors.black,
                    width: 1.sp,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 17.w, vertical: 7.w),
                  child: Text(
                    "https://benvoice.co.il/sGk69iFx",
                    style: FontTextStyle.w400Style(
                      color: Colors.black,
                      fontSize: 14.sp,
                    ),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                4,
                (index) => Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {},
                      iconSize: 36.sp,
                      icon: SvgPicture.asset(
                        shareWith["images"]![index],
                        width: 36.w,
                        height: 36.h,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Text(
                      shareWith["title"]![index],
                      style: FontTextStyle.w400Style(
                        color: Colors.black,
                        fontSize: 14.sp,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ),
    transitionDuration: Duration.zero,
  );
}
