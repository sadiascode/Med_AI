import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_storage/get_storage.dart';
import 'dart:io';
import '../../../common/app_shell.dart';
import '../../../common/custom_medium.dart';
import '../services/profile_services.dart';
import '../widget/custom_txt.dart';
import '../models/profile_model.dart';
import 'edit_screen.dart';
import '../../auth/ui/screen/signin_screen.dart';

class MyprofileScreen extends StatefulWidget {
  const MyprofileScreen({super.key});

  @override
  State<MyprofileScreen> createState() => _MyprofileScreenState();
}

class _MyprofileScreenState extends State<MyprofileScreen> {
  ProfileModel? _profile;
  bool _isLoading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _loadProfile();
  }

  Future<void> _loadProfile() async {
    try {
      final profile = await ProfileService.getProfile();

      // Check for locally stored image path since API doesn't support profile pictures
      final localImagePath = await ProfileService.getLocalImagePath();

      ProfileModel updatedProfile = profile;
      if (localImagePath != null) {
        updatedProfile = profile.copyWith(profilePicture: localImagePath);
      }

      setState(() {
        _profile = updatedProfile;
        _isLoading = false;
        _error = null;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
        _error = e.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
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
        body: const Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Color(0xffE0712D)),
          ),
        ),
      );
    }

    if (_error != null) {
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
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Please login to access your profile',
                style: TextStyle(fontSize: 16, color: Colors.orange[700]),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SigninScreen(),
                    ),
                        (route) => false,
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xffE0712D),
                  foregroundColor: Colors.white,
                ),
                child: const Text('Go to Login'),
              ),
            ],
          ),
        ),
      );
    }

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
                              child: _profile?.profilePicture != null
                                  ? Builder(
                                builder: (context) {
                                  if (_profile!.profilePicture!
                                      .startsWith('/data/') ||
                                      _profile!.profilePicture!
                                          .startsWith('file://')) {
                                    return Image.file(
                                      File(_profile!.profilePicture!),
                                      width: 150,
                                      height: 150,
                                      fit: BoxFit.cover,
                                      errorBuilder:
                                          (context, error, stackTrace) {
                                        return Icon(
                                          Icons.person,
                                          size: 150,
                                          color: Colors.grey[600],
                                        );
                                      },
                                    );
                                  } else {
                                    return Image.network(
                                      _profile!.profilePicture!,
                                      width: 150,
                                      height: 150,
                                      fit: BoxFit.cover,
                                      errorBuilder:
                                          (context, error, stackTrace) {
                                        return Icon(
                                          Icons.person,
                                          size: 150,
                                          color: Colors.grey[600],
                                        );
                                      },
                                    );
                                  }
                                },
                              )
                                  : Icon(
                                Icons.person,
                                size: 150,
                                color: Colors.grey[600],
                              ),
                            ),
                          ),
                          const SizedBox(height: 15),
                          Text(
                            _profile?.fullName ?? 'Loading...',
                            style: const TextStyle(
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
                            MaterialPageRoute(
                              builder: (context) => const EditScreen(),
                            ),
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
              CustomTxt(
                title: "Full Name:",
                subtitle: _profile?.fullName ?? 'N/A',
              ),
              const SizedBox(height: 5),
              CustomTxt(title: "Email:", subtitle: _profile?.email ?? 'N/A'),
              const SizedBox(height: 5),
              const CustomTxt(title: "Phone Number:", subtitle: "Not provided"),
              const SizedBox(height: 5),
              CustomTxt(
                title: "Address:",
                subtitle: _profile?.address ?? 'Not provided',
              ),

              SizedBox(height: 20),
              CustomMedium(text: "Other Info", onTap: () {}),

              const SizedBox(height: 15),
              CustomTxt(
                title: "Age:",
                subtitle: _profile?.age ?? 'Not provided',
              ),
              const SizedBox(height: 5),
              CustomTxt(
                title: "Health condition:",
                subtitle: _profile?.healthCondition ?? 'Not provided',
              ),
              const SizedBox(height: 5),
              CustomTxt(
                title: "Wakeup time:",
                subtitle: _profile?.wakeupTime ?? 'Not provided',
              ),
              const SizedBox(height: 5),
              CustomTxt(
                title: "Breakfast time:",
                subtitle: _profile?.breakfastTime ?? 'Not provided',
              ),
              const SizedBox(height: 5),
              CustomTxt(
                title: "Lunch time:",
                subtitle: _profile?.lunchTime ?? 'Not provided',
              ),
              const SizedBox(height: 5),
              CustomTxt(
                title: "Dinner time:",
                subtitle: _profile?.dinnerTime ?? 'Not provided',
              ),
              SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }
}
