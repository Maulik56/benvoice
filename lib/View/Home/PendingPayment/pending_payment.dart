import 'package:benvoice/Constant/decoration.dart';
import 'package:benvoice/Constant/image_path.dart';
import 'package:benvoice/Constant/text_style.dart';
import 'package:benvoice/View/Home/PendingPayment/tab_approved_payments.dart';
import 'package:benvoice/View/Home/PendingPayment/tab_confirmation_payments.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class PendingPaymentScreen extends StatefulWidget {
  const PendingPaymentScreen({super.key});

  @override
  State<PendingPaymentScreen> createState() => _PendingPaymentScreenState();
}

class _PendingPaymentScreenState extends State<PendingPaymentScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        decoration: BackgroundColorContainer.kLinearGradient(),
        child: SafeArea(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: SvgPicture.asset(ImagePath.backArrow),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(ImagePath.menu),
                  ),
                ],
              ),
              TabBar(
                controller: _tabController,
                unselectedLabelColor: Colors.black,
                isScrollable: true,
                indicatorColor: Colors.transparent,
                labelColor: Colors.black,
                unselectedLabelStyle: FontTextStyle.w400Style(
                  color: Colors.black,
                  fontSize: 26.sp,
                ),
                labelStyle: FontTextStyle.w700Style(
                  color: Colors.black,
                  fontSize: 26.sp,
                ),
                tabs: const [
                  Text("תשלומים שאושרו"),
                  Text("תשלומים לאישור"),
                ],
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: const [
                    ApprovedPaymentsTab(),
                    ConfirmationPaymentsTab(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
