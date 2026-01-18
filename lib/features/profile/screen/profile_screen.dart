import 'package:care_agent/common/custom_button.dart';
import 'package:care_agent/common/custom_medium.dart';
import 'package:care_agent/features/auth/screen/signin_screen.dart';
import 'package:care_agent/features/profile/screen/edit_screen.dart';
import 'package:care_agent/features/profile/screen/prescription_screen.dart';
import 'package:care_agent/features/profile/widget/custom_prescriptions.dart';
import 'package:care_agent/features/profile/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../common/app_shell.dart';

/// Content-only version for use inside AppShell (no navbar)
class ProfileScreenContent extends StatelessWidget {
  const ProfileScreenContent({super.key});

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
              const SizedBox(height: 20),
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
                            color: const Color(0xFFFFF5F0),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: SvgPicture.asset(
                            'assets/edi.svg',
                            width: 18,
                            height: 18,
                            colorFilter: const ColorFilter.mode(
                              Color(0xffE0712D),
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              CustomMedium(text: "Profile Info", onTap: () {}),
              const SizedBox(height: 15),
              const CustomText(title: "Full Name:", subtitle: "Israt Jahan"),
              const SizedBox(height: 5),
              const CustomText(title: "Email:", subtitle: "abc@gmail.com"),
              const SizedBox(height: 5),
              const CustomText(title: "Phone Number:", subtitle: "075682145"),
              const SizedBox(height: 5),
              const CustomText(
                title: "Address:",
                subtitle: "20 Cooper Square, New York, NY \n10003, USA",
              ),
              const SizedBox(height: 15),
              CustomMedium(text: "Other Info", onTap: () {}),
              const SizedBox(height: 15),
              const CustomText(title: "Age:", subtitle: "28"),
              const SizedBox(height: 5),
              const CustomText(title: "Health condition:", subtitle: "Good"),
              const SizedBox(height: 5),
              const CustomText(title: "Wakeup time:", subtitle: "7:00 am"),
              const SizedBox(height: 5),
              const CustomText(title: "Breakfast time:", subtitle: "8:00 am"),
              const SizedBox(height: 5),
              const CustomText(title: "Lunch time:", subtitle: "2:00 pm"),
              const SizedBox(height: 5),
              const CustomText(title: "Dinner time:", subtitle: "9:00 am"),
              const SizedBox(height: 15),
              CustomMedium(text: "Your prescriptions", onTap: () {}),
              const SizedBox(height: 15),
              CustomPrescriptions(
                prescriptionName: 'Prescriptin-1',
                date: '01/05/25',
                onDownload: () {},
                onShow: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const PrescriptionScreen()),
                  );
                },
                onDelete: () {},
              ),
              const SizedBox(height: 15),
              CustomPrescriptions(
                prescriptionName: 'Prescriptin-1',
                date: '01/05/25',
                onDownload: () {},
                onShow: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const PrescriptionScreen()),
                  );
                },
                onDelete: () {},
              ),
              const SizedBox(height: 15),
              CustomButton(text: "Sign Out", onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SigninScreen()),
                );
              }),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}

/// Standalone version with navbar - redirects to AppShell
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppShell(initialIndex: 4);
  }
}