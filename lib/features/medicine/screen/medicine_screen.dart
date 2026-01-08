import 'package:care_agent/features/medicine/screen/add_screen.dart';
import 'package:care_agent/features/medicine/screen/calender_screen.dart';
import 'package:flutter/material.dart';
import '../widget/custom_refill.dart';
import '../widget/custom_search.dart';

class MedicineScreen extends StatefulWidget {
  const MedicineScreen({super.key});

  @override
  State<MedicineScreen> createState() => _MedicineScreenState();
}

class _MedicineScreenState extends State<MedicineScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFAF7),
      appBar: AppBar(
        backgroundColor: Color(0xffFFFFFF),
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: const Text(
          "Medicine List",
          style: TextStyle(
            color: Color(0xffE0712D),
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: IconButton(
              icon: const Icon(
                Icons.calendar_month,
                color: Color(0xffE0712D),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CalenderScreen()),
                );
              },
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10),
            CustomSearch(),

            SizedBox(height: 10),
            CustomRefill(
                  medicineName: 'Napa Extra',
                  remainingCount: 4,
                  onRefill: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const AddScreen()),
                    );
                    },
            ),

            SizedBox(height: 13),
            CustomRefill(
              medicineName: 'Napa Extra',
              remainingCount: 4,
              onRefill: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AddScreen()),
                );
              },
            ),

            SizedBox(height: 13),
            CustomRefill(
              medicineName: 'Napa Extra',
              remainingCount: 4,
              onRefill: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AddScreen()),
                );
              },
            ),

            SizedBox(height: 13),
            CustomRefill(
              medicineName: 'Napa Extra',
              remainingCount: 4,
              onRefill: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AddScreen()),
                );
              },
            ),

            SizedBox(height: 13),
            CustomRefill(
              medicineName: 'Napa Extra',
              remainingCount: 4,
              onRefill: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AddScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
