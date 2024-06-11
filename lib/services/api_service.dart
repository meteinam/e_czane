import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String apiBaseUrl = '';
  Future<void> postData(Map<String, String> userData, void Function() success,
      String endPoint) async {
    final url = Uri.parse(apiBaseUrl + endPoint);

    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(userData),
      );

      if (response.statusCode == 200) {
        success;
      } else {
        print('Failed to post data: ${response.statusCode}');
        print('Response: ${response.body}');
      }
    } catch (e) {
      print('Error occurred: $e');
    }
  }

  Future<void> getData(void Function(String) success, String endPoint) async {
    final url = Uri.parse(apiBaseUrl + endPoint);

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        success(response.body);
      } else {
        print('Failed to get data: ${response.statusCode}');
        print('Response: ${response.body}');
      }
    } catch (e) {
      print('Error occurred: $e');
    }
  }

  Future<void> deleteData(void Function() success, String endPoint) async {
    final url = Uri.parse(apiBaseUrl + endPoint);

    try {
      final response = await http.delete(url);

      if (response.statusCode == 200) {
        success;
      } else {
        print('Failed to delete data: ${response.statusCode}');
        print('Response: ${response.body}');
      }
    } catch (e) {
      print('Error occurred: $e');
    }
  }

  Future<void> putData(Map<String, String> userData, void Function() success,
      String endPoint) async {
    final url = Uri.parse(apiBaseUrl + endPoint);

    try {
      final response = await http.put(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(userData),
      );

      if (response.statusCode == 200) {
        success;
      } else {
        print('Failed to put data: ${response.statusCode}');
        print('Response: ${response.body}');
      }
    } catch (e) {
      print('Error occurred: $e');
    }
  }
}
