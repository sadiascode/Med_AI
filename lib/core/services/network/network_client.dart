import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:logger/logger.dart';

class NetworkResponse {
  final int statusCode;
  final Map<String, dynamic>? responseData;
  final String? errorMessage;
  final bool isSuccess;

  NetworkResponse({
    required this.isSuccess,
    required this.statusCode,
    this.responseData,
    this.errorMessage,
  });
}

class NetworkClient {
  final Logger _logger = Logger();
  final String _defaultErrorMessage = "Something went wrong";

  final VoidCallback onUnAuthorize; // 401 callback
  final Map<String, String> Function() commonHeaders;

  NetworkClient({required this.onUnAuthorize, required this.commonHeaders});

  Map<String, String> _getHeaders() {
    final headers = commonHeaders();
    headers['Content-Type'] = 'application/json';
    headers['Accept'] = 'application/json';
    return headers;
  }

  Future<NetworkResponse> getRequest(String url) async {
    try {
      Uri uri = Uri.parse(url);
      _logRequest(url, headers: _getHeaders());
      final Response response = await get(uri, headers: _getHeaders());
      _logResponse(response);
      return _handleResponse(response);
    } catch (e) {
      return _errorResponse(e);
    }
  }

  Future<NetworkResponse> postRequest(String url, {Map<String, dynamic>? body}) async {
    try {
      Uri uri = Uri.parse(url);
      _logRequest(url, headers: _getHeaders(), body: body);
      final Response response = await post(uri, headers: _getHeaders(), body: jsonEncode(body));
      _logResponse(response);
      return _handleResponse(response);
    } catch (e) {
      return _errorResponse(e);
    }
  }

  Future<NetworkResponse> putRequest(String url, {Map<String, dynamic>? body}) async {
    try {
      Uri uri = Uri.parse(url);
      _logRequest(url, headers: _getHeaders(), body: body);
      final Response response = await put(uri, headers: _getHeaders(), body: jsonEncode(body));
      _logResponse(response);
      return _handleResponse(response);
    } catch (e) {
      return _errorResponse(e);
    }
  }

  Future<NetworkResponse> patchRequest(String url, {Map<String, dynamic>? body}) async {
    try {
      Uri uri = Uri.parse(url);
      _logRequest(url, headers: _getHeaders(), body: body);
      final Response response = await patch(uri, headers: _getHeaders(), body: jsonEncode(body));
      _logResponse(response);
      return _handleResponse(response);
    } catch (e) {
      return _errorResponse(e);
    }
  }

  Future<NetworkResponse> deleteRequest(String url, {Map<String, dynamic>? body}) async {
    try {
      Uri uri = Uri.parse(url);
      _logRequest(url, headers: _getHeaders(), body: body);
      final Response response = await delete(uri, headers: _getHeaders(), body: jsonEncode(body));
      _logResponse(response);
      return _handleResponse(response);
    } catch (e) {
      return _errorResponse(e);
    }
  }

  NetworkResponse _handleResponse(Response response) {
    try {
      final responseBody = response.body.isNotEmpty ? jsonDecode(response.body) : {};

      if (response.statusCode == 200 || response.statusCode == 201) {
        return NetworkResponse(
          isSuccess: true,
          statusCode: response.statusCode,
          responseData: responseBody,
        );
      } else if (response.statusCode == 401) {
        onUnAuthorize();
        return NetworkResponse(
          isSuccess: false,
          statusCode: response.statusCode,
          errorMessage: "Unauthorized",
        );
      } else {
        return NetworkResponse(
          isSuccess: false,
          statusCode: response.statusCode,
          errorMessage: responseBody['msg'] ?? _defaultErrorMessage,
        );
      }
    } catch (e) {
      return NetworkResponse(
        isSuccess: false,
        statusCode: response.statusCode,
        errorMessage: 'Failed to parse response',
      );
    }
  }

  NetworkResponse _errorResponse(dynamic e) {
    return NetworkResponse(
      isSuccess: false,
      statusCode: -1,
      errorMessage: e.toString(),
    );
  }

  void _logRequest(String url, {Map<String, String>? headers, Map<String, dynamic>? body}) {
    final message = '''
URL -> $url
HEADERS -> $headers
BODY -> $body
''';
    _logger.i(message);
  }

  void _logResponse(Response response) {
    final message = '''
URL -> ${response.request?.url}
STATUS -> ${response.statusCode}
HEADERS -> ${response.request?.headers}
BODY -> ${response.body}
''';
    _logger.i(message);
  }
}
