import 'dart:convert';

import 'package:another_flushbar/flushbar.dart';
import 'package:e_czane/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<List<Pharmacy>> getDutyPharmacyData(
    String il, String ilce, BuildContext context) async {
  try {
    final response = await http.get(
        Uri.parse(
            'https://api.collectapi.com/health/dutyPharmacy?ilce=$ilce&il=$il'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization':
              'apikey 6yTcvTR0pr9TMLqWnEloZJ:54uvobKCaSRPpTWd7QowNk',
        });
    if (response.statusCode >= 200 && response.statusCode < 300) {
      List<dynamic> data = json.decode(response.body)['result'];
      return data.map((json) => Pharmacy.fromJson(json)).toList();
    } else {
      if (context.mounted) {
        Flushbar(
          message:
              'İşlem sırasında hata oluştu: ${response.statusCode} ${response.body}',
          duration: const Duration(seconds: 3),
        ).show(context);
      }
    }
    return jsonDecode(response.body);
  } catch (e) {
    if (context.mounted) {
      Flushbar(
        message: 'Bir hata oluştu: $e',
        duration: const Duration(seconds: 3),
      ).show(context);
    }
  }
  throw Exception('An error occurred while fetching duty pharmacy data.');
}
