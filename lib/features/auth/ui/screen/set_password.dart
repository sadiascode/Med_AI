import 'package:care_agent/common/custom_button.dart';
import 'package:care_agent/features/auth/ui/screen/successful_screen.dart';
import 'package:care_agent/features/auth/ui/screen/verify_screen.dart';
import 'package:flutter/material.dart';

import '../widget/custom_field.dart';
import '../widget/custom_screen.dart';

class SetPassword extends StatefulWidget {
  const SetPassword({super.key});

  @override
  State<SetPassword> createState() => _SetPasswordState();
}

class _SetPasswordState extends State<SetPassword> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: Color(0xffFFF0E6),
        body: CustomScreen(
            svgPath: 'assets/logo.svg',
            svgHeight: screenHeight * 0.16,
            svgWidth: screenWidth * 0.30,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  Center(child: Text("Set New Password",style: TextStyle(fontSize: 24),)),

                  SizedBox(height: 13),
                  Center(
                    child: Text(
                      "Set your account password to secure your account.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  SizedBox(height: 60),
                  CustomField(hintText: "New Password", isPassword: true,),

                  SizedBox(height: 20),
                  CustomField(hintText: "Retype New Password" ,isPassword: true,),

                  SizedBox(height: 20),
                  CustomButton(text: "Save", onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SuccessfulScreen()),
                    );
                  })

                ]
            )
        )
    );
  }
}
