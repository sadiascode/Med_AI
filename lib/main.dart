import 'package:care_agent/features/auth/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'app/app.dart';
import 'features/auth/controller/auth_controller.dart';
import 'core/services/network/network_client.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await GetStorage.init();

  Get.put<NetworkClient>(
    NetworkClient(
      onUnAuthorize: () {
        print("Unauthorized! Redirecting to login...");
        Get.offAllNamed('/signin');
      },
      commonHeaders: () {
        try {
          final authController = Get.find<AuthController>();
          if (authController.accessToken != null) {
            return {
              'Authorization': 'Bearer ${authController.accessToken}',
            };
          }
        } catch (e) {}
        return {};
      },
    ),
    permanent: true,
  );

  Get.put<AuthController>(AuthController(), permanent: true);
  Get.put<LoginController>(LoginController(), permanent: true);

  runApp(const CareAgent());
}