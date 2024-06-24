import 'dart:convert';
import 'dart:io';
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';

class ApiService {
  final String apiBaseUrl = 'https://10.0.2.2:7211/';

  // Create an HttpClient that ignores bad certificates
  HttpClient _createHttpClient() {
    final HttpClient client = HttpClient();
    client.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    return client;
  }

  IOClient _createIoClient() {
    return IOClient(_createHttpClient());
  }

  Future<void> postData(Map<String, String> userData, void Function() success,
      String endPoint, BuildContext context) async {
    final url = Uri.parse(apiBaseUrl + endPoint);
    final client = _createIoClient();

    try {
      final response = await client.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(userData),
      );

      if (response.statusCode == 200) {
        success();
      } else {
        if (context.mounted) {
          Flushbar(
            message:
                'İşlem sırasında hata oluştu: ${response.statusCode} ${response.body}',
            duration: const Duration(seconds: 3),
          ).show(context);
        }
      }
    } catch (e) {
      print(e);
      if (context.mounted) {
        Flushbar(
          message: 'Bir hata oluştu: $e',
          duration: const Duration(seconds: 3),
        ).show(context);
      }
    }
  }

  Future getData(String endPoint, BuildContext context) async {
    final url = Uri.parse(apiBaseUrl + endPoint);
    final client = _createIoClient();
    var userData;

    try {
      final response = await client.get(url);

      if (response.statusCode == 200) {
        userData = jsonDecode(response.body);
        return userData;
      } else {
        if (context.mounted) {
          Flushbar(
            message:
                'İşlem sırasında hata oluştu: ${response.statusCode} ${response.body}',
            duration: const Duration(seconds: 3),
          ).show(context);
        }
      }
    } catch (e) {
      if (context.mounted) {
        Flushbar(
          message: 'Bir hata oluştu: $e',
          duration: const Duration(seconds: 3),
        ).show(context);
      }
    }
  }

  Future<void> deleteData(
      void Function() success, String endPoint, BuildContext context) async {
    final url = Uri.parse(apiBaseUrl + endPoint);
    final client = _createIoClient();

    try {
      final response = await client.delete(url);

      if (response.statusCode == 200) {
        success();
      } else {
        if (context.mounted) {
          Flushbar(
            message:
                'Silme işlemi sırasında hata oluştu: ${response.statusCode} ${response.body}',
            duration: const Duration(seconds: 3),
          ).show(context);
        }
      }
    } catch (e) {
      if (context.mounted) {
        Flushbar(
          message: 'Bir hata oluştu: $e',
          duration: const Duration(seconds: 3),
        ).show(context);
      }
    }
  }

  Future<void> putData(Map<String, String> userData, void Function() success,
      String endPoint, BuildContext context) async {
    final url = Uri.parse(apiBaseUrl + endPoint);
    final client = _createIoClient();

    try {
      final response = await client.put(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(userData),
      );
      if (response.statusCode == 200) {
        success();
      } else {
        if (context.mounted) {
          Flushbar(
            message:
                'Güncelleme sırasında hata oluştu: ${response.statusCode} ${response.body}',
            duration: const Duration(seconds: 3),
          ).show(context);
        }
      }
    } catch (e) {
      if (context.mounted) {
        Flushbar(
          message: 'Bir hata oluştu: $e',
          duration: const Duration(seconds: 3),
        ).show(context);
      }
    }
  }
}
