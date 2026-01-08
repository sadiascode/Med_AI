import 'package:care_agent/features/notification/widget/custom_notification.dart';
import 'package:flutter/material.dart';


class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Color(0xFFFFFAF7),
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.white,
        title:  Text(
          "Notifications",
          style: TextStyle(
            color: Color(0xffE0712D),
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 17,vertical: 10),
          child: Column(
            children: [
              SizedBox(height: 20),
              CustomNotification(
                title: 'Medical test alert!',
                message: 'You need to check your sugar level! ',
                time: '4:46 PM', iconPath: 'assets/light.svg',),
              SizedBox(height: 15),
              const Divider(
                color: Color(0xffFFF0E6),
                thickness: 2,
                height: 1,
              ),
              SizedBox(height: 20),

              CustomNotification(
                title: 'Medical test alert!',
                message: 'You need to check your sugar level! ',
                time: '4:46 PM', iconPath: 'assets/not.svg',),
              SizedBox(height: 15),
              const Divider(
                color: Color(0xffFFF0E6),
                thickness: 2,
                height: 1,
              ),
              SizedBox(height: 20),

              CustomNotification(
                title: 'Medical test alert!',
                message: 'You need to check your sugar level! ',
                time: '09/05/25', iconPath: 'assets/time.svg',),
              SizedBox(height: 15),
              const Divider(
                color: Color(0xffFFF0E6),
                thickness: 2,
                height: 1,
              ),
              SizedBox(height: 20),

              CustomNotification(
                title: 'Medical test alert!',
                message: 'You need to check your sugar level! ',
                time: 'yesterday', iconPath: 'assets/cap.svg',),
              SizedBox(height: 15),
              const Divider(
                color: Color(0xffFFF0E6),
                thickness: 2,
                height: 1,
              ),
              SizedBox(height: 20),


            ],
          ),
        ),
      ),
    );
  }
}
