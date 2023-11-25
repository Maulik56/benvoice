import 'package:benvoice/Constant/decoration.dart';
import 'package:benvoice/Constant/image_path.dart';
import 'package:benvoice/View/Home/Report/MonthlyReport/monthly.dart';
import 'package:benvoice/View/Home/Report/QrtrlyReport/quarterly.dart';
import 'package:benvoice/View/Home/Report/WeeklyReport/weekly.dart';
import 'package:benvoice/View/Home/Report/YearlyReport/yearly.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../Constant/text_style.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 4, vsync: this, initialIndex: 1);

    _tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        clipBehavior: Clip.antiAlias,
        decoration: BackgroundColorContainer.kLinearGradient(),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _tabController.index != 1
                        ? IconButton(
                            onPressed: () {
                              _tabController.animateTo(1);
                            },
                            icon: SvgPicture.asset(ImagePath.backArrow),
                          )
                        : const SizedBox(),
                    IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(ImagePath.menu),
                    ),
                  ],
                ),
              ),
              TabBar(
                controller: _tabController,
                labelPadding: EdgeInsets.zero,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.sp),
                  color: Colors.white,
                  border: Border.all(color: const Color(0xFF989898)),
                ),
                unselectedLabelStyle: FontTextStyle.w400Style(
                  color: Colors.black,
                  fontSize: 20.sp,
                ),
                labelStyle: FontTextStyle.w400Style(
                  color: Colors.black,
                  fontSize: 20.sp,
                ),
                labelColor: Colors.black,
                unselectedLabelColor: Colors.black,
                tabs: const [
                  Tab(text: 'שבועי'),
                  Tab(text: 'חודשי'),
                  Tab(text: 'רבעוני'),
                  Tab(text: 'שנתי'),
                ],
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: const [
                    WeeklyReportScreen(),
                    MonthlyReportScreen(),
                    QuarterlyReportScreen(),
                    YearlyReportScreen(),
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
