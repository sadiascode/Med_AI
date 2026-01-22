import 'dart:convert';

import 'package:care_agent/core/services/network/network_client.dart';
import 'package:care_agent/app/utils/urls.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/user_model.dart';

class AuthController extends GetxController {
  static const String _userKey = 'user_data';
  static const String _tokenKey = 'access_token';

  UserModel? userModel;
  String? accessToken;

  /// Call this once when app starts
  Future<void> loadUserData() async {
    final prefs = await SharedPreferences.getInstance();

    final String? userJson = prefs.getString(_userKey);
    final String? token = prefs.getString(_tokenKey);

    if (userJson != null && token != null) {
      userModel = UserModel.fromJson(jsonDecode(userJson));
      accessToken = token;
    }
  }

  /// Save user info after login/signup
  Future<void> saveUserData(String token, UserModel user) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString(_tokenKey, token);
    await prefs.setString(_userKey, jsonEncode(user.toJson()));

    accessToken = token;
    userModel = user;
  }

  /// Check login status
  bool get isLoggedIn => accessToken != null && accessToken!.isNotEmpty;


  /// For Login
  Future<void> login(String email, String password) async {
    final response = await Get.find<NetworkClient>().postRequest(
      Urls.login,
      body: {
        'email': email,
        'password': password,
      },
    );

    if (!response.isSuccess) {
      throw Exception(response.errorMessage ?? 'Login failed');
    }

    final data = response.responseData!['data'];

    await saveUserData(
      data['token'],
      UserModel.fromJson(data['user']),
    );
  }


  /// Logout user
  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_tokenKey);
    await prefs.remove(_userKey);

    accessToken = null;
    userModel = null;
  }
}
