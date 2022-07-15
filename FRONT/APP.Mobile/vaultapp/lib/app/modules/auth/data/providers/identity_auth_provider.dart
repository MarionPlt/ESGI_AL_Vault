import 'dart:convert';

import 'package:http/http.dart' as http;

class IdentityAuthProvider {
  final authUrl = 'http://localhost:5238/auth';

  Future<String> login(String username, String password) async {
    final response = await http.post(
        Uri.parse("$authUrl/login"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(
            <String, String>{'username': username, 'password': password}));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }
    if (response.statusCode == 401) {
      throw Exception("Unauthorized");
    } else {
      throw Exception(response.statusCode);
    }
  }

  Future<String> register(String username, String password) async {
    final response = await http.post(Uri.parse(authUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(
            <String, String>{'username': username, 'password': password}));

    if (response.statusCode == 201) {
      return jsonDecode(response.body);
    } else {
      throw Exception(response.statusCode);
    }
  }
}
