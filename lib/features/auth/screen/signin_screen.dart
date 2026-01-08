import 'package:care_agent/common/navbar/custom_bottom_navbar.dart';
import 'package:care_agent/features/auth/screen/forget_screen.dart';
import 'package:care_agent/features/auth/screen/signup_screen.dart';
import 'package:care_agent/features/auth/widget/custom_field.dart';
import 'package:flutter/material.dart';
import '../../../common/custom_button.dart';
import '../widget/custom_google.dart';
import '../widget/custom_screen.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  bool rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFF0E6),
      body: CustomScreen(
        svgPath: 'assets/logo.svg',
        svgHeight: 180,
        svgWidth: 130,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: Text("Welcome to Med AI",style: TextStyle(fontSize: 24),)),
              SizedBox(height: 15),
              CustomField(hintText: "email",borderColor: Color(0xffE0712D),),
              SizedBox(height: 17),
              CustomField(hintText: "Password",borderColor: Color(0xffE0712D),isPassword: true,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value: rememberMe,
                        onChanged: (value) {
                          setState(() {
                            rememberMe = value ?? false;
                          });
                        },
                      ),
                      const Text("Remember Me", style: TextStyle(fontSize: 14)),
                    ],
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const ForgetScreen()),
                      );
                    },
                    child: const Text(
                      "Forgot Password?",
                      style: TextStyle(fontSize: 14, color: Color(0xff333333)),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              CustomButton(text: "Sign in", onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const BottomNavScreen()),
                );
              },),
              SizedBox(height: 15),
              CustomGoogle(text: "Sign in with Google", svgPath: "assets/google.svg"),
              SizedBox(height: 10),
              CustomGoogle(text: "Sign in with Apple", svgPath: "assets/apple.svg"),
              SizedBox(height: 17),
      Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Don't have an account? ",
              style: TextStyle(
                fontSize: 15,
                color: Colors.grey[700],
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SignupScreen()),
                );
              },
              child: Text(
                "Sign up",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFFE0712D),
                ),
              ),
            ),
                ]

        ),
      ]
      ),
    ),
    );
  }
}
