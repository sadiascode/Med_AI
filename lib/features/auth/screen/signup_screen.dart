import 'package:care_agent/common/custom_button.dart';
import 'package:care_agent/features/auth/screen/signin_screen.dart';
import 'package:care_agent/features/auth/widget/custom_field.dart';
import 'package:flutter/material.dart';

import '../widget/custom_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
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
                  Center(child: Text("Welcome to Med AI",style: TextStyle(fontSize: 24),)),
                  SizedBox(height: 15),

                  Center(child: Text("Sign up to get started",style: TextStyle(fontSize: 17),)),
                  SizedBox(height: 45),

                  CustomField(hintText: "Full Name",),
                  SizedBox(height: 18),

                  CustomField(hintText: "Email/Phone Number",),
                  SizedBox(height: 18),

                  CustomField(hintText: "Password",isPassword: true,),
                  SizedBox(height: 35),

                  CustomButton(text: "Sign up", onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SigninScreen()),
                    );
                  })
                ]
            ),
        ),
    );
  }
}
