import 'package:shared_preferences/shared_preferences.dart';

saveToken(String token, int retry) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();

  await preferences.setString('LastToken', token);
  await preferences.setInt('LastRetry', retry);
}