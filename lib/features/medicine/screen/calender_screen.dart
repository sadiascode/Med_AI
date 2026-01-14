import 'package:care_agent/features/home/widgets/dynamic_date_header_widget.dart';
import 'package:flutter/material.dart';
import '../../../common/app_shell.dart';
import '../../home/widgets/calendar_widget.dart';
import '../../home/widgets/medicine_card_widget.dart';
import '../../home/widgets/time_header_widget.dart';

class CalenderScreen extends StatefulWidget {
  const CalenderScreen({super.key});

  @override
  State<CalenderScreen> createState() => _CalenderScreenState();
}

class _CalenderScreenState extends State<CalenderScreen> {
  @override
  Widget build(BuildContext context) {
    return SubPageScaffold(
      parentTabIndex: 1, // Medicine is parent
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios, color: Color(0xffE0712D), size: 18),
        ),
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            DynamicDateHeaderWidget(),
            SizedBox(height: 15),
            CalendarWidget(),
            SizedBox(height: 30),
            Text(
              "Today's Medicine",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            TimeHeader(svgPath: 'assets/morning.svg', title: "Morning"),
            MedicineCard(
              time: "08:00 AM",
              name: "Bisocor Tablet 2.5mg",
              dosage: "1 tablet",
            ),
            MedicineCard(
              time: "08:00 AM",
              name: "Bisocor Tablet 2.5mg",
              dosage: "1 tablet",
            ),
            TimeHeader(svgPath: 'assets/noon.svg', title: "Afternoon"),
            MedicineCard(
              time: "02:00 PM",
              name: "Bisocor Tablet 2.5mg",
              dosage: "1 tablet",
            ),
            TimeHeader(svgPath: 'assets/sunset.svg', title: "Evening"),
            MedicineCard(
              time: "08:00 PM",
              name: "Bisocor Tablet 2.5mg",
              dosage: "1 tablet",
            ),
            MedicineCard(
              time: "08:00 PM",
              name: "Bisocor Tablet 2.5mg",
              dosage: "1 tablet",
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
