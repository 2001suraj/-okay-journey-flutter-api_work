import 'dart:convert';

import 'package:api_work/data/models/user_model.dart';
import 'package:http/http.dart' as http;

class UserRepo{
  Future<User?> getUser() async {
    final response = await http.get(Uri.parse(
        'https://randomuser.me/api/'));

    if (response.statusCode != 200) {
      return null;
    } else {
      var data = jsonDecode(response.body);
      return User.fromJson(data);
    }
  }
}