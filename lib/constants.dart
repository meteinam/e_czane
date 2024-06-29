import 'package:flutter/material.dart';

Padding eczaneSmallPadding = const Padding(padding: EdgeInsets.all(5));
Padding eczaneMidPadding = const Padding(padding: EdgeInsets.all(15));
Padding eczaneBigPadding = const Padding(padding: EdgeInsets.all(25));

class DeviceSize {
  static double height = 0;
  static double width = 0;
  static void init(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
  }
}

class Medicine {
  final String name;
  final String? category;
  List<TimeOfDay> times;
  final int repeat;

  Medicine({
    required this.times,
    required this.repeat,
    required this.name,
    this.category,
  });

  factory Medicine.fromJson(Map<String, dynamic> json) {
    return Medicine(
      name: json['name'],
      category: json['category'],
      times: List<TimeOfDay>.from(json['times'].map((x) => TimeOfDay(
          hour: int.parse(x.split(":")[0]),
          minute: int.parse(x.split(":")[1])))),
      repeat: json['repeat'],
    );
  }

  List<String> getTimesAsIso8601String(DateTime referenceDate) {
    return times.map((time) {
      final dateTime = DateTime(referenceDate.year, referenceDate.month,
          referenceDate.day, time.hour, time.minute);
      return dateTime.toUtc().toIso8601String();
    }).toList();
  }
}

class Pharmacy {
  final String name;
  final String dist;
  final String address;
  final String phone;
  final String loc;

  Pharmacy(
      {required this.name,
      required this.dist,
      required this.address,
      required this.phone,
      required this.loc});

  factory Pharmacy.fromJson(Map<String, dynamic> json) {
    return Pharmacy(
      name: json['name'],
      dist: json['dist'],
      address: json['address'],
      phone: json['phone'],
      loc: json['loc'],
    );
  }
}

class User {
  final String accessToken;
  final String refreshToken;

  User({
    required this.accessToken,
    required this.refreshToken,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      accessToken: json['accessToken'],
      refreshToken: json['refreshToken'],
    );
  }
}
