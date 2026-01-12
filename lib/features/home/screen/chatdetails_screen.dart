import 'package:care_agent/features/home/screen/chatmed_screen.dart';
import 'package:care_agent/features/home/screen/home_screen.dart';
import 'package:care_agent/features/notification/widget/custom_minibutton.dart';
import 'package:flutter/material.dart';

import '../../profile/widget/custom_bull.dart';
import '../../profile/widget/custom_details.dart';
import '../../profile/widget/custom_details1.dart';
import '../../profile/widget/custom_info.dart';

class ChatdetailsScreen extends StatefulWidget {
  const ChatdetailsScreen({super.key});

  @override
  State<ChatdetailsScreen> createState() => _ChatdetailsScreenState();
}

class _ChatdetailsScreenState extends State<ChatdetailsScreen> {
  String selectedMeal = 'After Meal';
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: Color(0xFFFFFAF7),
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios, color: Color(0xffE0712D), size: 18),
          ),
          title: Text(
            "Prescription Details",
            style: TextStyle(
              color: Color(0xffE0712D),
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        body: SingleChildScrollView(
            child:  Column(
                children: [
                  Container(
                      color: Colors.white,
                      child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 13),
                          child: Container(
                              padding: EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(color: Color(0xffE0712D), width: 1),
                              ),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Patient’s information',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black87,
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    CustomDetails(name: 'Patient’s name', medicine: ' Smith Jaman',),
                                    const SizedBox(height: 10),
                                    CustomDetails(name: 'Doctor’s name', medicine: 'Dr. Robert Henry',),
                                    const SizedBox(height: 10),
                                    CustomInfo(name: "Patient’s age", age: "45", sex: 'Sex', gender: 'Female'),
                                    const SizedBox(height: 10),
                                    CustomDetails(name: 'Health Issue', medicine: ' Coronary artery disease',),
                                    const SizedBox(height: 10),
                                  ]
                              )
                          )
                      )
                  ),

                  SizedBox(height: 15),
                  Column(
                      children: [
                        Container(
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 13),
                              child: Container(
                                padding: EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(16),
                                  border: Border.all(color: Color(0xffE0712D), width: 1),
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
                                    SizedBox(height: 10),
                                    CustomDetails(name: 'Medicine Name', medicine: ' Bisocor Tablet 2.5mg',),
                                    const SizedBox(height: 10),
                                    CustomDetails1(name: "How many time/day"),
                                    const SizedBox(height: 10),
                                    CustomBull(
                                      selectedMeal: selectedMeal,
                                      onChanged: (value) {
                                        setState(() {
                                          selectedMeal = value;
                                        });
                                      },
                                    ),

                                    SizedBox(height: 20),
                                    CustomDetails(name: 'Medicine Name', medicine: ' Bisocor Tablet 2.5mg',),
                                    const SizedBox(height: 10),
                                    CustomDetails1(name: "How many time/day"),
                                    const SizedBox(height: 10),
                                    CustomBull(
                                      selectedMeal: selectedMeal,
                                      onChanged: (value) {
                                        setState(() {
                                          selectedMeal = value;
                                        });
                                      },
                                    ),

                                    SizedBox(height: 20),
                                    CustomDetails(name: 'Medicine Name', medicine: ' Bisocor Tablet 2.5mg',),
                                    const SizedBox(height: 10),
                                    CustomDetails1(name: "How many time/day"),
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
                            )
                        ),
                        SizedBox(height: 15),
                        Column(
                            children: [
                              Container(
                                  color: Colors.white,
                                  child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 13),
                                      child: Container(
                                          padding: EdgeInsets.all(16),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(16),
                                            border: Border.all(color: Color(0xffE0712D), width: 1),
                                          ),
                                          child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                const Text(
                                                  'Medical tests',
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black87,
                                                  ),
                                                ),
                                                SizedBox(height: 10),
                                                CustomDetails(name: 'Test 1', medicine: ' CVC',),
                                                const SizedBox(height: 10),
                                                CustomDetails(name: 'Test 2', medicine: 'ECG',),
                                                const SizedBox(height: 10),
                                                CustomDetails(name: 'Test 3', medicine: ' IGE',),
                                              ]
                                          )
                                      )
                                  )
                              ),
                              SizedBox(height: 15),
                              Center(child: Text("Next follow-up: 12/24/2025",style: TextStyle(color: Color(0xffE0712D)),)),
                              SizedBox(height: 20),
                              Row(
                                children: [
                                  SizedBox(width: screenWidth * 0.18),
                                  CustomMinibutton(
                                      text: "save", onTap: (){
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (_) => const ChatmedScreen()),
                                    );
                                  }, textcolor: Colors.white,
                                      backgroundColor: Color(0xffE0712D)),

                                  SizedBox(width: screenWidth * 0.05),
                                  CustomMinibutton(
                                      text: "Decline", onTap: (){
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (_) => const HomeScreen()),
                                    );
                                  }, textcolor: Color(0xffE0712D),
                                      backgroundColor: Colors.white),

                                ],
                              ),
                              SizedBox(height: 20),
                            ]
                        )
                      ]
                  ),
                ]
            )
        )
    );
  }
}