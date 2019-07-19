import 'package:shared_preferences/shared_preferences.dart';
import 'package:ntupartner/model/user_model.dart';

saveCurrentLogin(Map responseJson) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();


  var user = '';
  if ((responseJson != null && responseJson.isNotEmpty)) {
    user = UserModel.fromJson(responseJson).fullname;
  } else {
    user = "";
  }
  var token = (responseJson != null && responseJson.isNotEmpty) ? UserModel.fromJson(responseJson).token : "";
  var pk = (responseJson != null && responseJson.isNotEmpty) ? UserModel.fromJson(responseJson).id : 0;
  var interested_flag = (responseJson != null && responseJson.isNotEmpty) ? UserModel.fromJson(responseJson).interested_flag : false;
  var ban_flag = (responseJson != null && responseJson.isNotEmpty) ? UserModel.fromJson(responseJson).ban_flag : false;
  var description = (responseJson != null && responseJson.isNotEmpty) ? UserModel.fromJson(responseJson).description : "";
  var course_of_study = (responseJson != null && responseJson.isNotEmpty) ? UserModel.fromJson(responseJson).course_of_study : "";
  var date_of_birth = (responseJson != null && responseJson.isNotEmpty) ? UserModel.fromJson(responseJson).date_of_birth : "";
  var gender = (responseJson != null && responseJson.isNotEmpty) ? UserModel.fromJson(responseJson).gender : "";
  var year_of_matriculation = (responseJson != null && responseJson.isNotEmpty) ? UserModel.fromJson(responseJson).year_of_matriculation : 0;
  var religion = (responseJson != null && responseJson.isNotEmpty) ? UserModel.fromJson(responseJson).religion : "";
  var country_of_origin = (responseJson != null && responseJson.isNotEmpty) ? UserModel.fromJson(responseJson).country_of_origin : "";
  var hobbies = (responseJson != null && responseJson.isNotEmpty) ? UserModel.fromJson(responseJson).hobbies : "";
  var avatar_url = (responseJson != null && responseJson.isNotEmpty) ? UserModel.fromJson(responseJson).avatar_url : "";

  await preferences.setString('LastUser', (user != null && user.length > 0) ? user : "");
  await preferences.setString('LastToken', (token != null && token.length > 0) ? token : "");
  await preferences.setInt('LastId', (pk != null && pk > 0) ? pk : 0);
  await preferences.setBool('LastInterestedFlag', (interested_flag != null && interested_flag == true) ? interested_flag : false);
  await preferences.setBool('LastBanFlag', (ban_flag != null && ban_flag == false) ? ban_flag : true);
  await preferences.setString('LastDescription', (description != null && description.length > 0) ? description : "");
  await preferences.setString('LastCourseOfStudy', (course_of_study != null && course_of_study.length > 0) ? course_of_study : "");
  await preferences.setString('LastDateOfBirth', (date_of_birth != null && date_of_birth.length > 0) ? date_of_birth : "");
  await preferences.setString('LastGender', (gender != null && gender.length > 0) ? gender : "");
  await preferences.setInt('LastYearOfMatriculation', (year_of_matriculation != null && year_of_matriculation > 0) ? year_of_matriculation : 0);
  await preferences.setString('LastReligion', (religion != null && religion.length > 0) ? religion : "");
  await preferences.setString('LastCountryOfOrigin', (religion != null && country_of_origin.length > 0) ? religion : "");
  await preferences.setString('LastHobbies', (hobbies != null && hobbies.length > 0) ? hobbies : "");
  await preferences.setString('LastAvatarUrl', (avatar_url != null && avatar_url.length > 0) ? avatar_url : "");

}