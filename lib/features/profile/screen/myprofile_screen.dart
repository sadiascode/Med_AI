import 'package:care_agent/features/profile/screen/prescription_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../common/app_shell.dart';
import '../../../common/custom_button.dart';
import '../../../common/custom_medium.dart';
import '../../chat/widget/custom_text.dart';
import '../widget/custom_prescriptions.dart';
import '../widget/custom_txt.dart';
import 'edit_screen.dart';

class MyprofileScreen extends StatefulWidget {
  const MyprofileScreen({super.key});

  @override
  State<MyprofileScreen> createState() => _MyprofileScreenState();
}

class _MyprofileScreenState extends State<MyprofileScreen> {
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
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Color(0xffE0712D),
            size: 18,
          ),
        ),
        title: const Text(
          "My Profile",
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
               SizedBox(height: 15),
              const SizedBox(height: 15),
              const CustomTxt(title: "Full Name:", subtitle: "Israt Jahan"),
              const SizedBox(height: 5),
              const CustomTxt(title: "Email:", subtitle: "abc@gmail.com"),
              const SizedBox(height: 5),
              const CustomTxt(title: "Phone Number:", subtitle: "075682145"),
              const SizedBox(height: 5),
              const CustomTxt(
                title: "Address:",
                subtitle: "20 Cooper Square, New York, NY \n10003, USA",
              ),

              SizedBox(height: 20),
              CustomMedium(text: "Other Info", onTap: () {}),

              const SizedBox(height: 15),
              const CustomTxt(title: "Age:", subtitle: "28"),
              const SizedBox(height: 5),
              const CustomTxt(title: "Health condition:", subtitle: "Good"),
              const SizedBox(height: 5),
              const CustomTxt(title: "Wakeup time:", subtitle: "7:00 am"),
              const SizedBox(height: 5),
              const CustomTxt(title: "Breakfast time:", subtitle: "8:00 am"),
              const SizedBox(height: 5),
              const CustomTxt(title: "Lunch time:", subtitle: "2:00 pm"),
              const SizedBox(height: 5),
              const CustomTxt(title: "Dinner time:", subtitle: "9:00 am"),
              SizedBox(height: 15),

            ],
          ),
        ),
      ),
    );
  }
}
