import 'package:care_agent/common/custom_medium.dart';
import 'package:care_agent/features/profile/screen/edit_screen.dart';
import 'package:care_agent/features/profile/widget/custom_prescriptions.dart';
import 'package:care_agent/features/profile/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              SizedBox(height: 20),
              Container(
                height: 293,
                width: 380,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Stack(
                  children: [
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 170,
                            height: 170,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: ClipOval(
                              child: Image.network(
                                'https://images.unsplash.com/photo-1544005313-94ddf0286df2?w=200',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(height: 15),
                          const Text(
                            'Smith Jaman',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color(0xffE0712D),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 16,
                      right: 16,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const EditScreen()),
                          );
                        },
                        child: Container(
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                            color: Color(0xFFFFF5F0),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: SvgPicture.asset(
                            'assets/edi.svg',
                            width: 18,
                            height: 18,
                            color: Color(0xffE0712D),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15),
              CustomMedium(text: "Profile Info", onTap: (){}),


              SizedBox(height: 15),
              CustomText(title: "Full Name:", subtitle: "Israt Jahan"),

              SizedBox(height: 5),
              CustomText(title: "Email:", subtitle: "abc@gmail.com"),

              SizedBox(height: 5),
              CustomText(title: "Phone Number:", subtitle: "075682145"),

              SizedBox(height: 5),
              CustomText(title: "Address:", subtitle: "20 Cooper Square, New York, NY \n10003, USA"),

              SizedBox(height: 15),
              CustomMedium(text: "Other Info", onTap: (){}),

              SizedBox(height: 15),
              CustomText(title: "Age:", subtitle: "28"),

              SizedBox(height: 5),
              CustomText(title: "Health condition:", subtitle: "Good"),

              SizedBox(height: 5),
              CustomText(title: "Wakeup time:", subtitle: "7:00 am"),

              SizedBox(height: 5),
              CustomText(title: "Breakfast time:", subtitle: "8:00 am"),

              SizedBox(height: 5),
              CustomText(title: "Lunch time:", subtitle: "2:00 pm"),

              SizedBox(height: 5),
              CustomText(title: "Dinner time:", subtitle: "9:00 am"),
              
              SizedBox(height: 15),
              CustomMedium(text: "Your prescriptions", onTap: (){}),

              SizedBox(height: 15),
              CustomPrescriptions(
                prescriptionName: 'Prescriptin-1',
                date: '01/05/25',
                onDownload: () {},
                onShow: () {},
                onDelete: () {},
              ),

              SizedBox(height: 15),
              CustomPrescriptions(
                prescriptionName: 'Prescriptin-1',
                date: '01/05/25',
                onDownload: () {},
                onShow: () {},
                onDelete: () {},
              ),
              SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }
}