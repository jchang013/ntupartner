class UserModel {
  final String token;
  final int id;
  final String fullname;
  final bool interested_flag;
  final bool ban_flag;
  final String description;
  final String course_of_study;
  final String date_of_birth;
  final String gender;
  final int year_of_matriculation;
  final String religion;
  final String country_of_origin;
  final String hobbies;
  final String avatar_url;

  UserModel(this.token, this.id, this.fullname, this.interested_flag, this.ban_flag, this.description,
      this.course_of_study, this.date_of_birth,
       this.gender, this.year_of_matriculation, this.religion,
      this.country_of_origin, this.hobbies, this.avatar_url);

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
}