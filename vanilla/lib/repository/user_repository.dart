import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:vanilla/model/user.dart';
import 'package:vanilla/util/constant.dart';

class UserRepository {
  Future<List<User>> fetchUsers() async {
    print('bat dau request');
    final respone = await http.get(Constant.URL);
    if (respone.statusCode == 200) {
      var data = json.decode(respone.body) as List;
      var rest = data as List;
      List<User> list = rest.map<User>((json) => User.fromJson(json)).toList();
      return list;
    } else
      Exception('Failed to load list user');
    return null;
  }
}
