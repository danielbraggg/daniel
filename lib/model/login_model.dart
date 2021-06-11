class LoginModel {
  Data data;
  bool success;

  LoginModel({this.data, this.success});

  LoginModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    data['success'] = this.success;
    return data;
  }
}

class Data {
  String age;
  String firstName;
  String lastName;
  String username;

  Data({this.age, this.firstName, this.lastName, this.username});

  Data.fromJson(Map<String, dynamic> json) {
    age = json['age'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['age'] = this.age;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['username'] = this.username;
    return data;
  }
}
