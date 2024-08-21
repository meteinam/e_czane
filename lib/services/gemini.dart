import 'dart:convert';

import 'package:http/http.dart' as http;

const baseUrl =
    "https://generativelanguage.googleapis.com/v1beta/models/gemini-pro:generateContent?key="; //add api key here
final header = {
  "Content-Type": "application/json",
};
Future<String?> getGeminiData(String input) async {
  var message = {
    "contents": [
      {
        "parts": [
          {"text": "$input ilacı hakkında genel bilgi ver."}
        ]
      }
    ]
  };
  try {
    final response = await http.post(Uri.parse(baseUrl),
        headers: header, body: jsonEncode(message));

    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);
      var responseText =
          result["candidates"][0]["content"]["parts"][0]["text"].toString();
      return responseText;
    } else {
      return ("Request failed with status: ${response.statusCode}");
    }
  } catch (e) {
    return ("Error: $e");
  }
}
