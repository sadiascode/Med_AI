import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../common/custom_button.dart';
import '../auth/screen/signin_screen.dart';

class Splash1Screen extends StatefulWidget {
  const Splash1Screen({super.key});

  @override
  State<Splash1Screen> createState() => _Splash1ScreenState();
}

class _Splash1ScreenState extends State<Splash1Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SvgPicture.asset(
            'assets/splash2.svg',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover, ),


          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "Track and control your Health",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 25),
                Text(
                  "Where smart reminders meet better \nmedication",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 120),
                CustomButton(
                  text: "Start",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SigninScreen(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 65),
              ],
            ),
          ),
        ],
      ),
    );
  }
}