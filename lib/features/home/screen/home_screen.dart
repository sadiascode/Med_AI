import 'package:care_agent/features/chat/widget/action_input_bar_widget.dart';
import 'package:care_agent/features/home/screen/notification_screen.dart';
import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../common/app_shell.dart';
import '../widgets/appointment_cart_widget.dart';
import '../widgets/medicine_card_widget.dart';
import '../widgets/time_header_widget.dart';

class HomeScreenContent extends StatefulWidget {
  const HomeScreenContent({super.key});

  @override
  State<HomeScreenContent> createState() => _HomeScreenContentState();
}

class _HomeScreenContentState extends State<HomeScreenContent> {
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFAF7),
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: SvgPicture.asset(
          'assets/lo.svg',
          height: 39,
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const NotificationScreen()),
              );
            },
            icon: SvgPicture.asset(
              'assets/notification.svg',
              height: 24,
              width: 24,
            ),
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
                  Text(
                    'Today 01 December, 2025',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
              const SizedBox(height: 15),
              DatePicker(
                DateTime.now(),
                initialSelectedDate: selectedDate,
                height: 75,
                width: 48,
                selectionColor: Color(0xffE0712D),
                selectedTextColor: Colors.white,
                dateTextStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                dayTextStyle: const TextStyle(
                  fontSize: 10,
                  color: Color(0xff1C1C1C),
                ),
                monthTextStyle: const TextStyle(
                  fontSize: 10,
                  color: Color(0xff1C1C1C),
                ),
                onDateChange: (date) {
                  setState(() {
                    selectedDate = date;
                  });
                },
              ),
              const SizedBox(height: 30),
              const Text(
                "Today's Medicine",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const TimeHeader(svgPath: 'assets/morning.svg', title: "Morning"),
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
              const TimeHeader(svgPath: 'assets/noon.svg', title: "Afternoon"),
              const MedicineCard(
                time: "02:00 PM",
                name: "Bisocor Tablet 2.5mg",
                dosage: "1 tablet",
              ),
              const TimeHeader(svgPath: 'assets/sunset.svg', title: "Evening"),
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
              const SizedBox(height: 20),
              const ActionInputBarWidget(),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppShell(initialIndex: 0);
  }
}
