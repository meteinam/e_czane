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
    await http
        .post(Uri.parse(baseUrl), headers: header, body: jsonEncode(message))
        .then((value) {
      if (value.statusCode == 200) {
        var result = jsonDecode(value.body);
        print(result["candidates"][0]["content"]["parts"][0]["text"]);
        var response = result["candidates"][0]["content"]["parts"][0]["text"];
        return response;
      }
    });
  } catch (e) {
    print(e);
    return null;
  }
}
