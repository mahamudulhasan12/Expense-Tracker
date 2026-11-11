import 'dart:developer';

import 'package:http/http.dart' as http;



import 'dart:convert';

class AuthService {


  Future<Map<String, dynamic>> login({
    required String email,
    required String password,
  }) async {
    try {
      final url = Uri.parse('{Exp}/login');

      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
      );

      final Map<String, dynamic> data =
      jsonDecode(response.body);

      if (response.statusCode >= 200 &&
          response.statusCode < 300) {
        log("============");
        return {
          'success': true,
          'message': data['message'] ?? 'Login successful',
          'data': data,
        };
      }

      return {
        'success': false,
        'message': data['message'] ?? 'Login failed',
      };
    } catch (e) {
      return {
        'success': false,
        'message': 'Something went wrong: $e',
      };
    }
  }
}
