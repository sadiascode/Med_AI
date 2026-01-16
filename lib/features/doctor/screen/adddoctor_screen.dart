import 'package:care_agent/common/custom_button.dart';
import 'package:care_agent/features/doctor/screen/doctor_screen.dart';
import 'package:flutter/material.dart';
import '../../../common/app_shell.dart';
import '../widget/custom_Docadd.dart';

class AdddoctorScreen extends StatefulWidget {
  const AdddoctorScreen({super.key});

  @override
  State<AdddoctorScreen> createState() => _AdddoctorScreenState();
}

class _AdddoctorScreenState extends State<AdddoctorScreen> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final size = MediaQuery.of(context).size;

    return SubPageScaffold(
      parentTabIndex: 2,
      backgroundColor: const Color(0xFFFFFAF7),
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios, color: Color(0xffE0712D), size: 18),
        ),
        title: const Text(
          "Add Doctors",
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
            SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Container(
                height: size.height * 0.70,
                width: size.width * 0.92,
                decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
                ),
child: Column(
  children: [
    CustomDocadd(
      title: 'Doctor Name',
      hint: 'Type doctor name here',
    ),
    CustomDocadd(
      title: 'Sex',
      hint: 'Select sex',
      isDropdown: true,
      dropdownItems: ['Male', 'Female', 'Others'],
      onChanged: (value) {},
    ),
    CustomDocadd(
      title: 'Specialization',
      hint: 'Select Specialization',
      isDropdown: true,
      dropdownItems: [
        'General Physician',
        'Cardiologist',
        'Dermatologist',
        'Neurologist',
        'Gynecologist',
        'Ophthalmologist',
        'ENT Specialist',
        'Psychiatrist',

      ],
      onChanged: (value) {},
    ),
    CustomDocadd(
      title: 'Hospital Name',
      hint: 'Please enter Hospital Name',
    ),
    SizedBox(height: 15),
    CustomButton(text: "Confirm", onTap: (){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const DoctorScreen()),
      );
    })
  ],
),

              ),
            ),
          ],
        ),
      ),
    );
  }
}