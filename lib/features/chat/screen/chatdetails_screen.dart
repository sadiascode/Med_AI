import 'package:care_agent/features/chat/screen/chats_screen.dart';
import 'package:care_agent/features/chat/widget/custom_linkwith.dart';
import 'package:care_agent/features/doctor/widget/custom_doctor.dart';
import 'package:care_agent/features/doctor/models/doctor_list_model.dart';
import 'package:care_agent/features/doctor/services/doctor_api_service.dart';
import 'package:flutter/material.dart';
import '../../../common/app_shell.dart';
import '../../profile/widget/custom_bull.dart';
import '../../profile/widget/custom_details.dart';
import '../../profile/widget/custom_details1.dart';
import '../../profile/widget/custom_info.dart';
import '../widget/custom_minibutton.dart';

class ChatdetailsScreen extends StatefulWidget {
  const ChatdetailsScreen({super.key});

  @override
  State<ChatdetailsScreen> createState() => _ChatdetailsScreenState();
}

class _ChatdetailsScreenState extends State<ChatdetailsScreen> {
  String selectedMeal1 = 'After Meal';
  List<DoctorListModel> doctors = [];
  bool isLoadingDoctors = true;
  String? doctorError;

  @override
  void initState() {
    super.initState();
    _fetchDoctors();
  }

  Future<void> _fetchDoctors() async {
    try {
      final doctorList = await DoctorApiService.getDoctorList();
      setState(() {
        doctors = doctorList;
        isLoadingDoctors = false;
      });
    } catch (e) {
      setState(() {
        doctorError = e.toString();
        isLoadingDoctors = false;
      });
    }
  }
  String selectedMeal2 = 'After Meal';
  String selectedMeal3 = 'After Meal';
  String selectedMeal4 = 'After Meal';
  String selectedMeal5 = 'After Meal';
  String selectedMeal6 = 'After Meal';
  String selectedMeal7 = 'After Meal';
  String selectedMeal8 = 'After Meal';

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
                          const CustomDetails1(name: "Morning",subtitle: "8:00",),
                          CustomDetails1(name: "How many time/day",subtitle: "3",),
                          const SizedBox(height: 5),
                          CustomBull(
                            selectedMeal: selectedMeal1,
                            onChanged: (value) {
                              setState(() {
                                selectedMeal1 = value;
                              });
                            },
                          ),
                          const SizedBox(height: 15),
                          const CustomDetails1(name: "Afternoon",subtitle: "01:00",),
                          CustomDetails1(name: "How many time/day",subtitle: "3",),
                          const SizedBox(height: 5),
                          CustomBull(
                            selectedMeal: selectedMeal2,
                            onChanged: (value) {
                              setState(() {
                                selectedMeal2 = value;
                              });
                            },
                          ),
                          const SizedBox(height: 15),
                          const CustomDetails1(name: "Evening",subtitle: "05:00 ",),
                          CustomDetails1(name: "How many time/day",subtitle: "3",),
                          const SizedBox(height: 5),
                          CustomBull(
                            selectedMeal: selectedMeal3,
                            onChanged: (value) {
                              setState(() {
                                selectedMeal3 = value;
                              });
                            },
                          ),
                          const SizedBox(height: 15),
                          const CustomDetails1(name: "Night",subtitle: "09:00",),
                          CustomDetails1(name: "How many time/day",subtitle: "3",),
                          const SizedBox(height: 5),
                          CustomBull(
                            selectedMeal: selectedMeal4,
                            onChanged: (value) {
                              setState(() {
                                selectedMeal4 = value;
                              });
                            },
                          ),
                          const SizedBox(height: 20),
                          const CustomDetails(name: 'Medicine Name', medicine: ' Bisocor Tablet 2.5mg'),
                          const SizedBox(height: 10),
                          const CustomDetails1(name: "Morning",subtitle: "8:00",),
                          CustomDetails1(name: "How many time/day",subtitle: "3",),
                          const SizedBox(height: 5),
                          CustomBull(
                            selectedMeal: selectedMeal5,
                            onChanged: (value) {
                              setState(() {
                                selectedMeal5 = value;
                              });
                            },
                          ),
                          const SizedBox(height: 15),
                          const CustomDetails1(name: "Afternoon",subtitle: "01:00",),
                          CustomDetails1(name: "How many time/day",subtitle: "3",),
                          const SizedBox(height: 5),
                          CustomBull(
                            selectedMeal: selectedMeal6,
                            onChanged: (value) {
                              setState(() {
                                selectedMeal6 = value;
                              });
                            },
                          ),
                          const SizedBox(height: 15),
                          const CustomDetails1(name: "Evening",subtitle: "05:00 ",),
                          CustomDetails1(name: "How many time/day",subtitle: "3",),
                          const SizedBox(height: 5),
                          CustomBull(
                            selectedMeal: selectedMeal7,
                            onChanged: (value) {
                              setState(() {
                                selectedMeal7 = value;
                              });
                            },
                          ),
                          const SizedBox(height: 15),
                          const CustomDetails1(name: "Night",subtitle: "09:00",),
                          CustomDetails1(name: "How many time/day",subtitle: "3",),
                          const SizedBox(height: 5),
                          CustomBull(
                            selectedMeal: selectedMeal8,
                            onChanged: (value) {
                              setState(() {
                                selectedMeal8 = value;
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
                        style: TextStyle(color: Color(0xffE0712D),fontSize: 17),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.06,
                      width: MediaQuery.of(context).size.width * 0.96,
                      decoration: BoxDecoration(
                        color: Color(0xffE0712D),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Center(
                        child: Text(
                          "Doctor List",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    // Doctor List from API
                    Container(
                      height: 200, // Fixed height for ListView
                      child: isLoadingDoctors
                          ? Center(child: CircularProgressIndicator())
                          : doctorError != null
                              ? Center(
                                  child: Text(
                                    'Error loading doctors',
                                    style: TextStyle(color: Colors.red),
                                  ),
                                )
                              : ListView.builder(
                                  itemCount: doctors.length,
                                  itemBuilder: (context, index) {
                                    final doctor = doctors[index];
                                    return Padding(
                                      padding: const EdgeInsets.only(bottom: 10),
                                      child: CustomLinkwith(
                                        doctorName: doctor.name,
                                        specialization: doctor.specialization,
                                        hospital: doctor.hospitalName,
                                      ),
                                    );
                                  },
                                ),
                    ),
                    const SizedBox( height: 20),
                    Row(
                      children: [
                        SizedBox(width: screenWidth * 0.18),
                        CustomMinibutton(
                          text: "save",
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => const ChatsScreen()),
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
                              MaterialPageRoute(builder: (_) => const AppShell(initialIndex: 3)),
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
