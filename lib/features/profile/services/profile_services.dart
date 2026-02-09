import 'dart:convert';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import '../../../app/urls.dart';
import '../data/profile_model.dart';
import '../data/delete_account_request_model.dart';
import '../data/change_password_model.dart';

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

  static Future<bool> deleteAccount(String password) async {
    try {
      final deleteRequest = DeleteAccountRequestModel(password: password);
      
      final response = await http.post(
        Uri.parse(Urls.Delete_Account),
        headers: _getAuthHeaders(),
        body: jsonEncode(deleteRequest.toJson()),
      );

      if (response.statusCode == 200 || response.statusCode == 204) {
        return true;
      } else {
        throw Exception('Failed to delete account');
      }
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }

  static Future<bool> changePassword({
    required String currentPassword,
    required String newPassword,
    required String confirmPassword,
  }) async {
    try {
      final changeRequest = ChangePasswordModel(
        currentPassword: currentPassword,
        newPassword: newPassword,
        confirmPassword: confirmPassword,
      );
      
      final response = await http.post(
        Uri.parse(Urls.Change_Password),
        headers: _getAuthHeaders(),
        body: jsonEncode(changeRequest.toJson()),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return true;
      } else {
        String errorMessage = 'Failed to change password';
        try {
          final errorData = jsonDecode(response.body);
          if (errorData['message'] != null) {
            errorMessage = errorData['message'];
          } else if (errorData['current_password'] != null) {
            errorMessage = errorData['current_password'];
          } else if (errorData['new_password'] != null) {
            errorMessage = errorData['new_password'];
          } else if (errorData['confirm_password'] != null) {
            errorMessage = errorData['confirm_password'];
          } else if (errorData['detail'] != null) {
            errorMessage = errorData['detail'];
          } else if (errorData['error'] != null) {
            errorMessage = errorData['error'];
          }
        } catch (e) {
          errorMessage = response.body.isNotEmpty ? response.body : 'Something went wrong';
        }
        throw Exception(errorMessage);
      }
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }
}
