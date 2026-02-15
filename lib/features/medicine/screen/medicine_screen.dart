import 'package:care_agent/features/medicine/screen/add_screen.dart';
import 'package:flutter/material.dart';
import '../../../common/app_shell.dart';
import '../widget/custom_refill.dart';
import '../widget/custom_search.dart';
import '../models/medicine_model.dart';
import '../services/medicine_service.dart';

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
            FutureBuilder<List<MedicineModel>>(
              future: MedicineService.fetchMedicines(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: CircularProgressIndicator(color: Color(0xffE0712D)),
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          Icon(Icons.error_outline, size: 48, color: Colors.red),
                          const SizedBox(height: 16),
                          Text(
                            'Failed to load medicines',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            snapshot.error.toString(),
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  );
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          Icon(Icons.medication_outlined, size: 48, color: Colors.grey),
                          const SizedBox(height: 16),
                          Text(
                            'No medicines found',
                            style: TextStyle(fontSize: 16, color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  );
                } else {
                  final medicines = snapshot.data!;
                  return Column(
                    children: medicines.map((medicine) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 13),
                        child: CustomRefill(
                          medicineName: medicine.name,
                          remainingCount: medicine.stock,
                          onRefill: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AddScreen(medicine: medicine),
                              ),
                            );
                          },
                        ),
                      );
                    }).toList(),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class MedicineScreen extends StatelessWidget {
  const MedicineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppShell(initialIndex: 1);
  }
}
