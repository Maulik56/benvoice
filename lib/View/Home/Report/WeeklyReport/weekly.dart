import 'package:benvoice/View/Widget/elevated_button.dart';
import 'package:benvoice/View/Widget/s_f_circular_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:table_calendar/table_calendar.dart';

class WeeklyReportScreen extends StatefulWidget {
  const WeeklyReportScreen({super.key});

  @override
  State<WeeklyReportScreen> createState() => _WeeklyReportScreenState();
}

class _WeeklyReportScreenState extends State<WeeklyReportScreen> {
  late List<ChartData> data;
  late TooltipBehavior _tooltip;

  DateTime _focusedDay = DateTime.now();
  DateTime _selectedDay = DateTime.now();

  Decoration calenderDecoration = BoxDecoration(
    shape: BoxShape.rectangle,
    borderRadius: BorderRadius.circular(5),
  );

  @override
  void initState() {
    super.initState();
    data = ChartUtils.getChartData();
    _tooltip = TooltipBehavior(enable: true);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Column(
          children: [
            ChartUtils.createDoughnutChart(data, _tooltip),
            TableCalendar(
              focusedDay: _focusedDay,
              firstDay: DateTime.utc(1900, 10, 16),
              lastDay: DateTime.utc(2040, 10, 16),
              daysOfWeekVisible: false,
              headerVisible: false,
              calendarStyle: CalendarStyle(
                markerDecoration: calenderDecoration,
                holidayDecoration: calenderDecoration,
                defaultDecoration: calenderDecoration,
                outsideDecoration: calenderDecoration,
                weekendDecoration: calenderDecoration,
                todayDecoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Colors.blue.shade300,
                  borderRadius: BorderRadius.circular(5),
                ),
                selectedDecoration: BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              selectedDayPredicate: (day) {
                return isSameDay(_selectedDay, day);
              },
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                });
              },
            ),
            SizedBox(height: 21.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CommonElevatedButton(
                  onTap: () {},
                  title: "דיווח",
                  height: 62.h,
                  width: 139.w,
                ),
                CommonElevatedButton(
                  onTap: () {},
                  title: "סנכרון",
                  height: 62.h,
                  width: 158.w,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
