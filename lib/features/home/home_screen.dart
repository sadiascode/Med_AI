import 'package:care_agent/features/home/widgets/action_input_bar_widget.dart';
import 'package:care_agent/features/home/widgets/appointment_cart_widget.dart';
import 'package:care_agent/features/home/widgets/calendar_widget.dart';
import 'package:care_agent/features/home/widgets/dynamic_date_header_widget.dart';
import 'package:care_agent/features/home/widgets/logo_header_widget.dart';
import 'package:care_agent/features/home/widgets/medicine_card_widget.dart';
import 'package:care_agent/features/home/widgets/time_header_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            // Logo Header
            LogoHeaderWidget(),
            const SizedBox(height: 20),
            // Basic usage
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
            const Text(
              "Today's Appointments",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),
            const AppointmentCartWidget(),
            const SizedBox(height: 25),
            const Text(
              "Add prescription/appointment",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),
            const ActionInputBarWidget(),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
