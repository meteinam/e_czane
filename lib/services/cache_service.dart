import 'package:hive/hive.dart';

final _tokenBox = Hive.box('tokenBox');

void writeHive(String accessToken, String refreshToken) {
  _tokenBox.put('accessToken', accessToken);
  _tokenBox.put('refreshToken', refreshToken);
}

readHive(String key) {
  print(_tokenBox.get(key));
  return _tokenBox.get(key);
}

void deleteHive(String key) {
  _tokenBox.delete(key);
}
