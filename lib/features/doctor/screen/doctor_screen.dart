import 'package:care_agent/features/doctor/screen/view_screen.dart';
import 'package:care_agent/features/medicine/widget/custom_search.dart';
import 'package:flutter/material.dart';
import '../widget/custom_doctor.dart';

class DoctorScreen extends StatefulWidget {
  const DoctorScreen({super.key});

  @override
  State<DoctorScreen> createState() => _DoctorScreenState();
}

class _DoctorScreenState extends State<DoctorScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFAF7),
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          "Profile",
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
         CustomSearch(),

        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child:
            Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: () {},
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.add, color: Color(0xFFE0712D), size: 20),
                  SizedBox(width: 8),
                  Text('Add pharmacy',
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
          )
        ),
          SizedBox(height: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
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
                    );},
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
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
                        onTap: () {},
                      ),
                      SizedBox(height: 10),
                      CustomDoctor(
                        doctorName: 'Dr. Shakil Mirja',
                        specialization: 'Cardiologist',
                        hospital: 'Evercare Hospital',
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ],
           ),
            SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
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
                        onTap: () {},
                      ),
                      SizedBox(height: 10),
                      CustomDoctor(
                        doctorName: 'Dr. Shakil Mirja',
                        specialization: 'Cardiologist',
                        hospital: 'Evercare Hospital',
                        onTap: () {},
                      ),
                      SizedBox(height: 10),
                      CustomDoctor(
                        doctorName: 'Dr. Shakil Mirja',
                        specialization: 'Cardiologist',
                        hospital: 'Evercare Hospital',
                        onTap: () {},
                      ),
                      SizedBox(height: 10),
                      CustomDoctor(
                        doctorName: 'Dr. Shakil Mirja',
                        specialization: 'Cardiologist',
                        hospital: 'Evercare Hospital',
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
         ]
        ),
      ]
        )
    )
    );
  }
}
