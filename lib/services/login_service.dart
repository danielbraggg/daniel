import 'dart:convert';
import 'package:daniel_project/model/login_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<LoginModel> loginUser(String userName, String password) async {
    String correctUsername = 'daniel@yahoo.com';
    String correctPassword = 'password123';
    dynamic result;
    var response = await http.get(
        'https://test-project-fa3c5-default-rtdb.firebaseio.com/test-success.json');

    String sampleErrorJson = '{"success": false,"data": null}';

    if (userName == correctUsername && password == correctPassword) {
      result = jsonDecode(response.body);
    } else {
      result = jsonDecode(sampleErrorJson);
    }

    return LoginModel.fromJson(result);
  }
}
