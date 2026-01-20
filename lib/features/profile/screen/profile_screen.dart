import 'package:care_agent/common/custom_button.dart';
import 'package:care_agent/common/custom_medium.dart';
import 'package:care_agent/features/auth/screen/signin_screen.dart';
import 'package:care_agent/features/profile/screen/edit_screen.dart';
import 'package:care_agent/features/profile/screen/myprofile_screen.dart';
import 'package:care_agent/features/profile/screen/prescp_screen.dart';
import 'package:care_agent/features/profile/screen/prescription_screen.dart';
import 'package:care_agent/features/profile/widget/custom_new.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../common/app_shell.dart';
import '../../chat/widget/custom_minibutton.dart';
import '../widget/custom_edit.dart';

/// Content-only version for use inside AppShell (no navbar)
class ProfileScreenContent extends StatefulWidget {
  const ProfileScreenContent({super.key});

  @override
  State<ProfileScreenContent> createState() => _ProfileScreenContentState();
}

class _ProfileScreenContentState extends State<ProfileScreenContent> {

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

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
              SizedBox(height: 15),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MyprofileScreen()),
                  );
                },
                 child:  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.05,
                      vertical: screenWidth * 0.02,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(screenWidth * 0.03),
                      border: const Border(
                        left: BorderSide(color: Color(0xffE0712D), width: 5),
                        top: BorderSide(color: Color(0xffE0712D), width: 1),
                        right: BorderSide(color: Color(0xffE0712D), width: 1),
                        bottom: BorderSide(color: Color(0xffE0712D), width: 1),
                      ),
                    ),
                    child: Row(
                      children: [
                        ClipOval(
                          child: Image.network(
                            'https://images.unsplash.com/photo-1544005313-94ddf0286df2?w=200',
                           height: 47,
                            width: 47,
                          ),
                        ),

                        SizedBox(width: MediaQuery.of(context).size.width * 0.03),
                        Expanded(
                          child: Text(
                            "My Profile",
                            style: TextStyle(
                              fontSize: MediaQuery.of(context).size.width * 0.045,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                        ),

                        Icon(
                          Icons.arrow_forward_ios,
                          size: MediaQuery.of(context).size.width * 0.045,
                          color: Color(0xffE0712D),
                        ),
                      ],
                    ),
                  ),
              ),
              SizedBox(height: 25),
              CustomNew(
                text: "Change Password",
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        backgroundColor: const Color(0xFFFFFAF7),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                        content: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.9,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CustomEdit(
                                title: "Current password",
                                hintText: "Admin User",
                              ),
                              const SizedBox(height: 10),
                              CustomEdit(
                                title: "New Password",
                                hintText: "**************",
                              ),
                              const SizedBox(height: 10),
                              CustomEdit(
                                title: "Confirm Password",
                                hintText: "**************",
                              ),
                              const SizedBox(height: 15),
                            ],
                          ),
                        ),
                        actions: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CustomMinibutton(
                                text: 'Yes',
                                textcolor: Colors.white,
                                onTap: () {
                                  Navigator.of(context).pop();
                                },
                                backgroundColor: const Color(0xFFE0712D),
                              ),
                              const SizedBox(width: 7),
                              CustomMinibutton(
                                text: 'No',
                                textcolor: const Color(0xffE0712D),
                                onTap: () {
                                  Navigator.of(context).pop();
                                },
                                backgroundColor: const Color(0xffFFFAF7),
                              ),
                            ],
                          ),
                        ],
                      );
                    },
                  );
                },
              ),

              SizedBox(height: 10),

              CustomNew(text: "Your Prescriptions", onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PrescpScreen()),
                );
              }),
              SizedBox(height: 10),

              CustomNew(text: "Privacy Policy"),
              SizedBox(height: 10),

              CustomNew(text: "Terms and Conditions"),
              SizedBox(height: 10),

              CustomNew(text: "Deactivate"),
              SizedBox(height: 10),


              SizedBox(height: 35),
              CustomButton(text: "Sign Out", onTap: (){
                showDialog(
                  context: context,
                  builder: (context) {
                    return Dialog(
                      backgroundColor: Color(0xffFFFAF7),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      insetPadding: const EdgeInsets.symmetric(horizontal: 35),
                      child: Padding(
                        padding: const EdgeInsets.all(24),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Confirm Sign Out",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 16),
                            const Text(
                              "Are you sure you want to sign out?",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                height: 1.4,
                              ),
                            ),
                            const SizedBox(height: 24),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text(
                                    "Cancel",
                                    style: TextStyle(color: Colors.blue, fontSize: 16),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => const SigninScreen()),
                                    );
                                  },
                                  child: const Text(
                                    "Sign Out",
                                    style: TextStyle(color: Colors.red, fontSize: 16),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              ),
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