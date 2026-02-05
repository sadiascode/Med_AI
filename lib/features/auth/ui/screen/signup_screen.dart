import 'package:care_agent/common/custom_button.dart';
import 'package:care_agent/features/auth/data/signup_model.dart';
import 'package:care_agent/features/auth/ui/screen/signin_screen.dart';
import 'package:care_agent/app/urls.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';

import '../widget/custom_field.dart';
import '../widget/custom_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> _signupUser() async {
    final signupData = SignupMode(
      email: emailController.text.trim(),
      fullName: fullNameController.text.trim(),
      password: passwordController.text,
    );

    try {
      final response = await http.post(
        Uri.parse(Urls.Signup),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(signupData.toJson()),
      ).timeout(
        Duration(seconds: 30),
        onTimeout: () {
          throw TimeoutException('Request timeout. Please try again.');
        },
      );

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 201 || response.statusCode == 200) {
        // Success - navigate to login
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Signup successful! Please login.'),
            backgroundColor: Colors.green,
          ),
        );
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const SigninScreen()),
        );
      } else if (response.statusCode == 400) {
        // Bad request - validation errors
        String errorMessage = 'Validation failed';
        try {
          final errorData = jsonDecode(response.body);
          if (errorData['email'] != null) {
            errorMessage = errorData['email'];
          } else if (errorData['full_name'] != null) {
            errorMessage = errorData['full_name'];
          } else if (errorData['password'] != null) {
            errorMessage = errorData['password'];
          } else if (errorData['message'] != null) {
            errorMessage = errorData['message'];
          }
        } catch (e) {
          errorMessage = response.body;
        }
        
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(errorMessage),
            backgroundColor: Colors.red,
          ),
        );
      } else if (response.statusCode == 409) {
        // Conflict - email already exists
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Email already registered. Please login.'),
            backgroundColor: Colors.orange,
          ),
        );
      } else {
        // Error - handle different response formats
        String errorMessage = 'Signup failed';
        
        try {
          final errorData = jsonDecode(response.body);
          
          if (errorData['message'] != null) {
            errorMessage = errorData['message'];
          } else if (errorData['email'] != null) {
            errorMessage = errorData['email'];
          } else if (errorData['error'] != null) {
            errorMessage = errorData['error'];
          }
        } catch (e) {
          // If JSON parsing fails, use response body directly
          errorMessage = response.body.isNotEmpty ? response.body : 'Server error occurred';
        }
        
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(errorMessage),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (e) {
      print('Signup Error: $e');
      String errorMessage = 'Network error occurred';
      
      if (e is TimeoutException) {
        errorMessage = 'Request timeout. Please check your connection.';
      } else if (e.toString().contains('SocketException')) {
        errorMessage = 'No internet connection. Please check your network.';
      }
      
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(errorMessage),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 5),
        ),
      );
    }
  }

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
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(child: Text("Welcome to Med AI",style: TextStyle(fontSize: 24),)),
                  SizedBox(height: 15),

                  Center(child: Text("Sign up to get started",style: TextStyle(fontSize: 17),)),
                  SizedBox(height: 45),

                  CustomField(hintText: "Full Name", controller: fullNameController,),
                  SizedBox(height: 18),

                  CustomField(hintText: "Email ",controller: emailController,),
                  SizedBox(height: 18),

                  CustomField(hintText: "Password",isPassword: true,controller:passwordController),
                  SizedBox(height: 35),

                  CustomButton(text: "Sign up", onTap: _signupUser),
                ]
              ),
            ),
        ),
    );
  }
}
