import 'package:care_agent/features/profile/widget/custom_details.dart';
import 'package:care_agent/features/profile/widget/custom_details1.dart';
import 'package:care_agent/features/profile/widget/custom_info.dart';
import 'package:flutter/material.dart';

import '../../../common/app_shell.dart';
import '../widget/custom_bull.dart';

class PrescriptionScreen extends StatefulWidget {
  const PrescriptionScreen({super.key});

  @override
  State<PrescriptionScreen> createState() => _PrescriptionScreenState();
}

class _PrescriptionScreenState extends State<PrescriptionScreen> {
  String selectedMeal = 'After Meal';
  @override
  Widget build(BuildContext context) {
    return SubPageScaffold(
      parentTabIndex: 4,
      backgroundColor: const Color(0xFFFFFAF7),
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios, color: Color(0xffE0712D), size: 18),
        ),
        title: const Text(
          "Prescription Details",
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
            Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 13),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: const Color(0xffE0712D), width: 1),
                  ),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Patient's information",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(height: 10),
                      CustomDetails(name: "Patient's name", medicine: ' Smith Jaman'),
                      SizedBox(height: 10),
                      CustomDetails(name: "Doctor's name", medicine: 'Dr. Robert Henry'),
                      SizedBox(height: 10),
                      CustomInfo(name: "Patient's age", age: "45", sex: 'Sex', gender: 'Female'),
                      SizedBox(height: 10),
                      CustomDetails(name: 'Health Issue', medicine: ' Coronary artery disease'),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
            Column(
              children: [
                Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 13),
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: const Color(0xffE0712D), width: 1),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Prescription Details',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 10),
                          const CustomDetails(name: 'Medicine Name', medicine: ' Bisocor Tablet 2.5mg'),
                          const SizedBox(height: 10),
                          const CustomDetails1(name: "How many time/day"),
                          const SizedBox(height: 10),
                          CustomBull(
                            selectedMeal: selectedMeal,
                            onChanged: (value) {
                              setState(() {
                                selectedMeal = value;
                              });
                            },
                          ),
                          const SizedBox(height: 20),
                          const CustomDetails(name: 'Medicine Name', medicine: ' Bisocor Tablet 2.5mg'),
                          const SizedBox(height: 10),
                          const CustomDetails1(name: "How many time/day"),
                          const SizedBox(height: 10),
                          CustomBull(
                            selectedMeal: selectedMeal,
                            onChanged: (value) {
                              setState(() {
                                selectedMeal = value;
                              });
                            },
                          ),
                          const SizedBox(height: 20),
                          const CustomDetails(name: 'Medicine Name', medicine: ' Bisocor Tablet 2.5mg'),
                          const SizedBox(height: 10),
                          const CustomDetails1(name: "How many time/day"),
                          const SizedBox(height: 10),
                          CustomBull(
                            selectedMeal: selectedMeal,
                            onChanged: (value) {
                              setState(() {
                                selectedMeal = value;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Column(
                  children: [
                    Container(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 13),
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: const Color(0xffE0712D), width: 1),
                          ),
                          child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Medical tests',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ),
                              ),
                              SizedBox(height: 10),
                              CustomDetails(name: 'Test 1', medicine: ' CVC'),
                              SizedBox(height: 10),
                              CustomDetails(name: 'Test 2', medicine: 'ECG'),
                              SizedBox(height: 10),
                              CustomDetails(name: 'Test 3', medicine: ' IGE'),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    const Center(child: Text("Next follow-up: 12/24/2025", style: TextStyle(color: Color(0xffE0712D)))),
                    const SizedBox(height: 20),
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