import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ProductService {
  String get baseUrl => dotenv.env['API_BASE_URL']!;

  // Headers required for JSON APIs
  final Map<String, String> headers = {
    'Content-Type': 'application/json; charset=UTF-8',
  };

  // Fetches data from the server
  Future<List<dynamic>> getLatestProducts() async {
    final url = Uri.parse('$baseUrl/latestProducts');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to load posts: ${response.statusCode}');
      }
    } catch (e) {
      debugPrint(e.toString());
      throw Exception('Error occurred during GET request: $e');
    }
  }

  // ==================== POST REQUEST ====================
  // Creates a new resource on the server
  Future<Map<String, dynamic>> createPost(
    String title,
    String body,
    int userId,
  ) async {
    final url = Uri.parse('$baseUrl/posts');

    final Map<String, dynamic> requestBody = {
      'title': title,
      'body': body,
      'userId': userId,
    };

    try {
      final response = await http.post(
        url,
        headers: headers,
        body: jsonEncode(requestBody),
      );

      if (response.statusCode == 201) {
        // 201 means "Created"
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to create post: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error occurred during POST request: $e');
    }
  }

  // ==================== PUT REQUEST ====================
  // Updates an existing resource completely
  Future<Map<String, dynamic>> updatePost(
    int id,
    String title,
    String body,
    int userId,
  ) async {
    final url = Uri.parse('$baseUrl/posts/$id');

    final Map<String, dynamic> requestBody = {
      'id': id,
      'title': title,
      'body': body,
      'userId': userId,
    };

    try {
      final response = await http.put(
        url,
        headers: headers,
        body: jsonEncode(requestBody),
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to update post: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error occurred during PUT request: $e');
    }
  }

  // ==================== DELETE REQUEST ====================
  // Deletes a resource from the server
  Future<void> deletePost(int id) async {
    final url = Uri.parse('$baseUrl/posts/$id');

    try {
      final response = await http.delete(url, headers: headers);

      if (response.statusCode != 200) {
        throw Exception('Failed to delete post: ${response.statusCode}');
      }
      // JSONPlaceholder returns a 200 OK for successful deletion
      print('Post $id deleted successfully');
    } catch (e) {
      throw Exception('Error occurred during DELETE request: $e');
    }
  }
}
