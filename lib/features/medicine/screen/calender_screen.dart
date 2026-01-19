import 'package:flutter/material.dart';
import '../../home/widgets/medicine_card_widget.dart';
import '../../home/widgets/time_header_widget.dart';

class CalenderScreen extends StatelessWidget {
  const CalenderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 15),
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
