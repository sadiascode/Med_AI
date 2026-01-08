import 'package:care_agent/features/home/widgets/dynamic_date_header_widget.dart';
import 'package:flutter/material.dart';
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
    return Scaffold(
      backgroundColor: Color(0xFFFFFAF7),
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: ( Icon(Icons.arrow_back_ios, color: Color(0xffE0712D), size: 18))),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const DynamicDateHeaderWidget(),

            const SizedBox(height: 15),
            const CalendarWidget(),

            const SizedBox(height: 30),
            const Text(
              "Today's Medicine",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const TimeHeader(icon: Icons.wb_twilight, title: "Morning"),
            const MedicineCard(
              time: "08:00 AM",
              name: "Bisocor Tablet 2.5mg",
              dosage: "1 tablet",
            ),
            const MedicineCard(
              time: "08:00 AM",
              name: "Bisocor Tablet 2.5mg",
              dosage: "1 tablet",
            ),

            const TimeHeader(icon: Icons.wb_sunny_outlined, title: "Afternoon"),
            const MedicineCard(
              time: "02:00 PM",
              name: "Bisocor Tablet 2.5mg",
              dosage: "1 tablet",
            ),

            const TimeHeader(icon: Icons.wb_twilight, title: "Evening"),
            const MedicineCard(
              time: "08:00 PM",
              name: "Bisocor Tablet 2.5mg",
              dosage: "1 tablet",
            ),
            const MedicineCard(
              time: "08:00 PM",
              name: "Bisocor Tablet 2.5mg",
              dosage: "1 tablet",
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
