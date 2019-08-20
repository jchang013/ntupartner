import 'dart:io';
import 'dart:typed_data';

class UserModel {
  String token;
  int id;
  String fullname;
  bool interested_flag;
  bool ban_flag;
  String description;
  String course_of_study;
  String date_of_birth;
  String gender;
  int year_of_matriculation;
  String religion;
  String country_of_origin;
  String hobbies;
  String avatar_url;
  //File image;
  Uint8List imageBytes;

  /*UserModel(this.token, this.id, this.fullname, this.interested_flag, this.ban_flag, this.description,
      this.course_of_study, this.date_of_birth,
       this.gender, this.year_of_matriculation, this.religion,
      this.country_of_origin, this.hobbies, this.avatar_url);
*/
  UserModel(String token, int id, String fullname, bool interested_flag, bool ban_flag, String description,
      String course_of_study, String date_of_birth, String gender, int year_of_matriculation,
      String religion, String country_of_origin, String hobbies, String avatar_url) {
    this.token = token;
    this.id = id;
    this.fullname = fullname;
    this.interested_flag = interested_flag;
    this.ban_flag = ban_flag;
    this.description = description;
    this.course_of_study = course_of_study;
    this.date_of_birth = date_of_birth;
    this.gender = gender;
    this.year_of_matriculation = year_of_matriculation;
    this.religion = religion;
    this.country_of_origin = country_of_origin;
    this.hobbies = hobbies;
    this.avatar_url = avatar_url;
  }

  UserModel.fromJson(Map<String, dynamic> json)
      : ban_flag = json['ban_flag'],
        course_of_study = json['course_of_study'],
        date_of_birth = json['date_of_birth'],
        description = json['description'],
        fullname = json['fullname'],
        gender = json['gender'],
        id = json['id'],
        interested_flag = json['interested_flag'],
        token = json['token'],
        year_of_matriculation = json['year_of_matriculation'],
        religion = json['religion'],
        country_of_origin = json['country_of_origin'],
        hobbies = json['hobbies'],
        avatar_url = json['avatar'];

  Map<String, dynamic> toJson() =>
      {
        'ban_flag' : ban_flag,
        'course_of_study' : course_of_study,
        'date_of_birth' : date_of_birth,
        'description' : description,
        'fullname' : fullname,
        'gender' : gender,
        'id' : id,
        'interested_flag' : interested_flag,
        'token' : token,
        'year_of_matriculation' : year_of_matriculation,
        'religion' : religion,
        'country_of_origin': country_of_origin,
        'hobbies' : hobbies,
        'avatar' : avatar_url,
      };

  /*setImage(File image) {
    this.image = image;
  }

  File getImage(){
    return this.image;
  }*/

  set setImageBytes(Uint8List bytes) => this.imageBytes = bytes;

  Uint8List getImageBytes() {
    return this.imageBytes;
  }
}