// lib/services/api_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  // Base URL of your FastAPI server (change to your VPS when you deploy)
  final String baseUrl = 'http://127.0.0.1:8000';  // Use this for Android emulator
  // If using iOS simulator, use 'http://localhost:8000'
  // If testing on a physical device, use your computer's IP address
  
  // Method to register a new user
  Future<Map<String, dynamic>> registerUser(
    String email, 
    String username, 
    String password, 
    String oneTimeCode,
    String planType,
    int durationMonths) async {
    final response = await http.post(
      Uri.parse('$baseUrl/auth/register'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'email': email,
        'username': username,
        'password': password,
        'one_time_code': oneTimeCode,
        "plan_type" : planType,
        'duration_months': durationMonths,
      }),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to register: ${response.body}');
    }
  }

  // Method to login
  Future<String> login(String email, String password, String oneTimeCode) async {
    final response = await http.post(
      Uri.parse('$baseUrl/auth/token'),
      headers: <String, String>{
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: {
        'username': email,
        'password': password,
        'onetimecode': oneTimeCode,
      },
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      // Store the token
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('access_token', data['access_token']);
      return data['access_token'];
    } else {
      throw Exception('Failed to login: ${response.body}');
    }
  }

  // Method to get the current user's information
  Future<Map<String, dynamic>> getUserInfo() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('access_token');
    
    if (token == null) {
      throw Exception('No token found');
    }

    final response = await http.get(
      Uri.parse('$baseUrl/auth/me'),
      headers: <String, String>{
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to get user info: ${response.body}');
    }
  }

  // Method to get the user's active subscription
  Future<Map<String, dynamic>> getActiveSubscription() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('access_token');
    
    if (token == null) {
      throw Exception('No token found');
    }

    final response = await http.get(
      Uri.parse('$baseUrl/subscriptions/active'),
      headers: <String, String>{
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to get subscription: ${response.body}');
    }
  }

  // Method to logout
  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('access_token');
  }
}
