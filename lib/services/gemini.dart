import 'dart:convert';

import 'package:http/http.dart' as http;

const baseUrl =
    "https://generativelanguage.googleapis.com/v1beta/models/gemini-pro:generateContent?key=AIzaSyAVRrvSmipcQ4Rh7dx-yjeRg3s5r0kSfTQ";
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
      print(result["candidates"][0]["content"]["parts"][0]["text"]);
      var responseText =
          result["candidates"][0]["content"]["parts"][0]["text"].toString();
      return responseText;
    } else {
      print("Request failed with status: ${response.statusCode}");
      return null;
    }
  } catch (e) {
    print("Error: $e");
    return null;
  }
}
