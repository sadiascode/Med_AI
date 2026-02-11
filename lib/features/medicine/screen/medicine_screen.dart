import 'package:care_agent/features/medicine/screen/add_screen.dart';
import 'package:flutter/material.dart';
import '../../../common/app_shell.dart';
import '../widget/custom_refill.dart';
import '../widget/custom_search.dart';

/// Content-only version for use inside AppShell (no navbar)
class MedicineScreenContent extends StatelessWidget {
  const MedicineScreenContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFAF7),
      appBar: AppBar(
        backgroundColor: const Color(0xffFFFFFF),
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
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10),
            const CustomSearch(),
            const SizedBox(height: 10),
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
            const SizedBox(height: 13),
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
            const SizedBox(height: 13),
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
            const SizedBox(height: 13),
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
            const SizedBox(height: 13),
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

/// Standalone version with navbar - redirects to AppShell
class MedicineScreen extends StatelessWidget {
  const MedicineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppShell(initialIndex: 1);
  }
}
