import 'dart:convert';
import 'dart:io';
import 'package:another_flushbar/flushbar.dart';
import 'package:e_czane/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/io_client.dart';

class ApiService {
  final String apiBaseUrl = 'https://10.0.2.2:7211/';

  HttpClient _createHttpClient() {
    final HttpClient client = HttpClient();
    client.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    return client;
  }

  IOClient _createIoClient() {
    return IOClient(_createHttpClient());
  }

  Future postData(
      Map<String, String> userData,
      Function(Map<String, dynamic> data) success,
      String endPoint,
      BuildContext context) async {
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
        Map<String, dynamic> data = json.decode(response.body)['data'];
        success(data);
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

  Future<void> postDataWithToken(
      Map<String, dynamic> userData,
      String token,
      void Function() success,
      void Function() unauthorized,
      String endPoint,
      BuildContext context) async {
    final url = Uri.parse(apiBaseUrl + endPoint);
    final client = _createIoClient();

    try {
      final response = await client.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(userData),
      );

      if (response.statusCode == 200) {
        success();
      } else if (response.statusCode == 401) {
        unauthorized();
        if (context.mounted) {
          Flushbar(
            message: 'Lütfen tekrar giriş yapınız',
            duration: const Duration(seconds: 3),
          ).show(context);
        }
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

  Future getData(
      String endPoint,
      String token,
      Function(Map<String, dynamic> data) success,
      void Function() unauthorized,
      BuildContext context) async {
    final url = Uri.parse(apiBaseUrl + endPoint);
    final client = _createIoClient();

    try {
      final response = await client.get(url, headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      });

      if (response.statusCode == 200) {
        Map<String, dynamic> userData = json.decode(response.body)['data'];
        success(userData);
      } else if (response.statusCode == 401) {
        unauthorized();
        if (context.mounted) {
          Flushbar(
            message: 'Lütfen tekrar giriş yapınız',
            duration: const Duration(seconds: 3),
          ).show(context);
        }
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

  Future<List<GetMedicine>> getMedicineData(
      String endPoint,
      String token,
      Function(List<GetMedicine> data) success,
      void Function() unauthorized,
      BuildContext context) async {
    final url = Uri.parse(apiBaseUrl + endPoint);
    final client = _createIoClient();

    try {
      final response = await client.get(url, headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      });

      if (response.statusCode == 200) {
        List<dynamic> responseData = json.decode(response.body)['data'];
        List<GetMedicine> medicines =
            responseData.map((json) => GetMedicine.fromJson(json)).toList();
        success(medicines);
        return medicines;
      } else if (response.statusCode == 401) {
        unauthorized();
        if (context.mounted) {
          Flushbar(
            message: 'Lütfen tekrar giriş yapınız',
            duration: const Duration(seconds: 3),
          ).show(context);
        }
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

    return [];
  }

  Future<void> deleteData(
      void Function() success,
      String endPoint,
      String token,
      int id,
      void Function() unauthorized,
      BuildContext context) async {
    final url = Uri.parse(apiBaseUrl + endPoint + id.toString());
    final client = _createIoClient();

    try {
      final response = await client.delete(url, headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      });

      if (response.statusCode == 204) {
        success();
      } else if (response.statusCode == 401) {
        unauthorized();
        if (context.mounted) {
          Flushbar(
            message: 'Lütfen tekrar giriş yapınız',
            duration: const Duration(seconds: 3),
          ).show(context);
        }
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

  Future<void> putData(Map<String, String> userData, String token,
      void Function() success, String endPoint, BuildContext context) async {
    final url = Uri.parse(apiBaseUrl + endPoint);
    final client = _createIoClient();

    try {
      final response = await client.put(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
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
