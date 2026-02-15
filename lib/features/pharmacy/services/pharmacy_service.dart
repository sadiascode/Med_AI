import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get_storage/get_storage.dart';
import '../../../app/urls.dart';
import '../models/pharmacy_model.dart';

class PharmacyService {
  static final box = GetStorage();

  static Map<String, String> _getAuthHeaders() {
    final token = box.read('access_token');
    final headers = {'Content-Type': 'application/json'};
    if (token != null) {
      headers['Authorization'] = 'Bearer $token';
    }
    return headers;
  }

  static Future<List<PharmacyModel>> fetchPharmacies() async {
    try {
      final response = await http.get(
        Uri.parse(Urls.Medicine_list),
        headers: _getAuthHeaders(),
      ).timeout(const Duration(seconds: 30));

      if (response.statusCode == 200) {
        final List<dynamic> responseData = json.decode(response.body);
        return responseData
            .map((item) => PharmacyModel.fromJson(item as Map<String, dynamic>))
            .where((pharmacy) => pharmacy.pharmacy_name.isNotEmpty)
            .toList();
      } else {
        throw Exception('Failed to load pharmacies');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
