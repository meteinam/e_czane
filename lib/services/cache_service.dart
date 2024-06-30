import 'package:hive/hive.dart';

final _tokenBox = Hive.box('tokenBox');

void writeHive(String accessToken, String refreshToken) {
  _tokenBox.put('accessToken', accessToken);
  _tokenBox.put('refreshToken', refreshToken);
}

void writeUserToHive(String id, String name, String surname, String email,
    String tcId, String dateOfBirth) {
  _tokenBox.put('id', id);
  _tokenBox.put('name', name);
  _tokenBox.put('surname', surname);
  _tokenBox.put('email', email);
  _tokenBox.put('tcId', tcId);
  _tokenBox.put('dateOfBirth', dateOfBirth);
}

readHive(String key) {
  return _tokenBox.get(key);
}

void deleteHive(String key) {
  _tokenBox.delete(key);
}
