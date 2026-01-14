import 'package:care_agent/features/doctor/screen/view_screen.dart';
import 'package:care_agent/features/medicine/widget/custom_search.dart';
import 'package:flutter/material.dart';
import '../../../common/app_shell.dart';
import '../widget/custom_doctor.dart';

/// Content-only version for use inside AppShell (no navbar)
class DoctorScreenContent extends StatelessWidget {
  const DoctorScreenContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFAF7),
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          "Your doctors",
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
            const CustomSearch(),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {},
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.add, color: Color(0xFFE0712D), size: 20),
                      SizedBox(width: 8),
                      Text(
                        'Add doctors',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFFE0712D),
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.underline,
                          decorationColor: Color(0xFFE0712D),
                          decorationThickness: 1.5,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'Most recent',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: [
                      CustomDoctor(
                        doctorName: 'Dr. Shakil Mirja',
                        specialization: 'Cardiologist',
                        hospital: 'Evercare Hospital',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const ViewScreen()),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        'recent',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        children: [
                          CustomDoctor(
                            doctorName: 'Dr. Shakil Mirja',
                            specialization: 'Cardiologist',
                            hospital: 'Evercare Hospital',
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const ViewScreen()),
                              );
                            },
                          ),
                          const SizedBox(height: 10),
                          CustomDoctor(
                            doctorName: 'Dr. Shakil Mirja',
                            specialization: 'Cardiologist',
                            hospital: 'Evercare Hospital',
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const ViewScreen()),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        'Earlier',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        children: [
                          CustomDoctor(
                            doctorName: 'Dr. Shakil Mirja',
                            specialization: 'Cardiologist',
                            hospital: 'Evercare Hospital',
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const ViewScreen()),
                              );
                            },
                          ),
                          const SizedBox(height: 10),
                          CustomDoctor(
                            doctorName: 'Dr. Shakil Mirja',
                            specialization: 'Cardiologist',
                            hospital: 'Evercare Hospital',
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const ViewScreen()),
                              );
                            },
                          ),
                          const SizedBox(height: 10),
                          CustomDoctor(
                            doctorName: 'Dr. Shakil Mirja',
                            specialization: 'Cardiologist',
                            hospital: 'Evercare Hospital',
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const ViewScreen()),
                              );
                            },
                          ),
                          const SizedBox(height: 10),
                          CustomDoctor(
                            doctorName: 'Dr. Shakil Mirja',
                            specialization: 'Cardiologist',
                            hospital: 'Evercare Hospital',
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const ViewScreen()),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/// Standalone version with navbar - redirects to AppShell
class DoctorScreen extends StatelessWidget {
  const DoctorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppShell(initialIndex: 2);
  }
}
