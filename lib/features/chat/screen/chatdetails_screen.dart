import 'package:flutter/material.dart';
import '../../../common/app_shell.dart';
import '../../profile/widget/custom_bull.dart';
import '../../profile/widget/custom_details.dart';
import '../../profile/widget/custom_details1.dart';
import '../../profile/widget/custom_info.dart';
import '../widget/custom_minibutton.dart';
import 'chatmed_screen.dart';

class ChatdetailsScreen extends StatefulWidget {
  const ChatdetailsScreen({super.key});

  @override
  State<ChatdetailsScreen> createState() => _ChatdetailsScreenState();
}

class _ChatdetailsScreenState extends State<ChatdetailsScreen> {
  String selectedMeal1 = 'After Meal';
  String selectedMeal2 = 'After Meal';
  String selectedMeal3 = 'After Meal';

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return SubPageScaffold(
      parentTabIndex: 3,
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Patient's information",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const CustomDetails(name: "Patient's name", medicine: ' Smith Jaman'),
                      const SizedBox(height: 10),
                      const CustomDetails(name: "Doctor's name", medicine: 'Dr. Robert Henry'),
                      const SizedBox(height: 10),
                      const CustomInfo(name: "Patient's age", age: "45", sex: 'Sex', gender: 'Female'),
                      const SizedBox(height: 10),
                      const CustomDetails(name: 'Health Issue', medicine: ' Coronary artery disease'),
                      const SizedBox(height: 10),
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
                          const CustomDetails1(name: "How many time/day",subtitle: "3",),
                          const SizedBox(height: 10),
                          CustomBull(
                            selectedMeal: selectedMeal1,
                            onChanged: (value) {
                              setState(() {
                                selectedMeal3 = value;
                              });
                            },
                          ),
                          const SizedBox(height: 20),
                          const CustomDetails(name: 'Medicine Name', medicine: ' Bisocor Tablet 2.5mg'),
                          const SizedBox(height: 10),
                          const CustomDetails1(name: "How many time/day",subtitle: "2",),
                          const SizedBox(height: 10),
                          CustomBull(
                            selectedMeal: selectedMeal2,
                            onChanged: (value) {
                              setState(() {
                                selectedMeal2 = value;
                              });
                            },
                          ),
                          const SizedBox(height: 20),
                          const CustomDetails(name: 'Medicine Name', medicine: ' Bisocor Tablet 2.5mg'),
                          const SizedBox(height: 10),
                          const CustomDetails1(name: "How many time/day",subtitle: "3",),
                          const SizedBox(height: 10),
                          CustomBull(
                            selectedMeal: selectedMeal1,
                            onChanged: (value) {
                              setState(() {
                                selectedMeal3 = value;
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
                    const Center(
                      child: Text(
                        "Next follow-up: 12/24/2025",
                        style: TextStyle(color: Color(0xffE0712D)),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        SizedBox(width: screenWidth * 0.18),
                        CustomMinibutton(
                          text: "save",
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => const ChatmedScreen()),
                            );
                          },
                          textcolor: Colors.white,
                          backgroundColor: const Color(0xffE0712D),
                        ),
                        SizedBox(width: screenWidth * 0.05),
                        CustomMinibutton(
                          text: "Decline",
                          onTap: () {
                            // Go back to Home via AppShell
                            Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(builder: (_) => const AppShell(initialIndex: 0)),
                                  (route) => false,
                            );
                          },
                          textcolor: const Color(0xffE0712D),
                          backgroundColor: Colors.white,
                        ),
                      ],
                    ),
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
