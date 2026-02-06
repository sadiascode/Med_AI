import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get_storage/get_storage.dart';
import '../models/profile_model.dart';
import '../../../app/urls.dart';

class ProfileService {
  static final box = GetStorage();

  static Map<String, String> _getAuthHeaders() {
    final token = box.read('access_token');
    print(
      'Retrieved token: ${token != null ? "Bearer ${token.substring(0, 10)}..." : "No token found"}',
    );

    final headers = {'Content-Type': 'application/json'};

    if (token != null) {
      headers['Authorization'] = 'Bearer $token';
    }

    return headers;
  }

  static Future<ProfileModel> getProfile() async {
    try {
      final response = await http.get(
        Uri.parse(Urls.profile),
        headers: _getAuthHeaders(),
      );

      print('Profile API response status: ${response.statusCode}');
      print('Profile API response body: ${response.body}');

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        print('Profile data parsed: $data');
        return ProfileModel.fromJson(data);
      } else {
        throw Exception('Failed to load profile: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error loading profile: $e');
    }
  }

  static Future<ProfileModel> updateProfile(ProfileModel profile) async {
    try {
      final profileData = profile.toJson();
      print('Sending to API: $profileData');
      final response = await http.put(
        Uri.parse(Urls.update_profile),
        headers: _getAuthHeaders(),
        body: jsonEncode(profileData),
      );

      print('Update profile response status: ${response.statusCode}');
      print('Update profile response body: ${response.body}');

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        print('Profile updated successfully: $data');
        return ProfileModel.fromJson(data);
      } else {
        throw Exception('Failed to update profile: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error updating profile: $e');
    }
  }

  static Future<String?> getLocalImagePath() async {
    return box.read('profile_image_path');
  }

  static Future<void> signOut() async {
    await box.remove('access_token');
    await box.remove('refresh_token');
    print('User signed out successfully');
  }

  static Future<String> uploadProfilePicture(String imagePath) async {
    try {
      final request = http.MultipartRequest(
        'POST',
        Uri.parse('${Urls.profile}picture/'),
      );

      final imageFile = await http.MultipartFile.fromPath(
        'profile_picture',
        imagePath,
      );

      request.files.add(imageFile);

      // Add authorization header if token exists
      final token = box.read('access_token');
      if (token != null) {
        request.headers['Authorization'] = 'Bearer $token';
      }
      request.headers['Content-Type'] = 'multipart/form-data';

      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        return data['profile_picture'] ?? '';
      } else {
        throw Exception(
          'Failed to upload profile picture: ${response.statusCode}',
        );
      }
    } catch (e) {
      throw Exception('Error uploading profile picture: $e');
    }
  }
}
