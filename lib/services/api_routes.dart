import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiRoutes {
  final String baseUrl = 'https://anime-legacy-proxy.vercel.app/api';

  Future<dynamic> getUsers() async {
    final response = await http.get(Uri.parse('$baseUrl/users'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load user');
    }
  }

  Future<dynamic> authenticate(String email, String password) async {
    final users = await getUsers();
    for (var user in users) {
      if (user['email'] == email && user['passwordHash'] == password) {
        return user;
      }
    }
    return null;
  }
}
