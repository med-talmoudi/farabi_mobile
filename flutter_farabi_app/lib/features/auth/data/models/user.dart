class User {
  late int userId;
  late String name;
  late String lastName;
  late String phoneNumber;
  late String dateOfBirth;
  late String gender;
  late String password;

  User.fromJson(Map<String, dynamic> json) {
    userId = json["id"];
    name = json["name"];
    lastName = json["lastname"];
    phoneNumber = json["phonenumber"];
    dateOfBirth = json["birthdate"];
    gender = json["gender"];
  }

  User({
    this.name = '',
    this.lastName = '',
    this.phoneNumber = '',
    this.dateOfBirth = '',
    this.gender = '',
    this.password = '',
  });


} 


