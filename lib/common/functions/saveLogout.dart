import 'package:shared_preferences/shared_preferences.dart';

saveLogout() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();

  await preferences.setString('LastUser', "");
  await preferences.setString('LastToken', "");
  await preferences.setInt('LastId', 0);
  await preferences.setBool('LastInterestedFlag', false);
  await preferences.setBool('LastBanFlag', false);
  await preferences.setString('LastDescription', '');
  await preferences.setString('LastCourseOfStudy', '');
  await preferences.setString('LastDateOfBirth', '');
  await preferences.setString('LastGender', '');
  await preferences.setInt('LastYearOfMatriculation', 0);
  await preferences.setString('LastReligion', '');
  await preferences.setString('LastHobbies', '');
  await preferences.setString('LastAvatarUrl', '');
}