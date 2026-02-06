import 'package:flutter/material.dart';

import '../../../../common/custom_button.dart';

import '../widget/custom_field.dart';

import '../widget/custom_screen.dart';

import '../widget/custom_google.dart';

import 'signup_screen.dart';

import 'forget_screen.dart';

import '../../../home/screen/home_screen.dart';

import '../../data/signin_model.dart';

import '../../../../app/urls.dart';

import 'dart:convert';

import 'package:http/http.dart' as http;

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  bool rememberMe = false;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xffFFF0E6),
      body: CustomScreen(
        svgPath: 'assets/logo.svg',
        svgHeight: screenHeight * 0.16,
        svgWidth: screenWidth * 0.30,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Text(
                "Welcome to Med AI",
                style: TextStyle(fontSize: 24),
              ),
            ),
            const SizedBox(height: 15),
            CustomField(
              hintText: "Email",
              borderColor: const Color(0xffE0712D),
            ),
            const SizedBox(height: 17),
            CustomField(
              hintText: "Password",
              borderColor: const Color(0xffE0712D),
              isPassword: true,
            ),
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
             CustomButton(
              text: "Sign In",
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const HomeScreen()),
                );
              },
            ),
            SizedBox(height: screenHeight * 0.02),
            const CustomGoogle(
                text: "Sign in with Google", svgPath: "assets/google.svg"),
            SizedBox(height: screenHeight * 0.011),
            const CustomGoogle(
                text: "Sign in with Apple", svgPath: "assets/apple.svg"),
            SizedBox(height: screenHeight * 0.020),
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
                      MaterialPageRoute(builder: (_) => const SignupScreen()),
                    );
                  },
                  child: const Text(
                    "Sign up",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFFE0712D),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}