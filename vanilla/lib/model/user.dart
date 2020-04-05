import 'package:flutter/foundation.dart';

class User {
  final String id;
  final String firstName;
  final String lastName;
  final String avatar;
  String _email;
  String _phone;
  String _about;
  int _age;

  String get email => _email;

  String get phone => _phone;

  String get about => _about;

  int get age => _age;

  String getFullName() {
    return firstName + ' ' + lastName;
  }

  User({@required this.id, @required this.firstName, @required this.lastName, @required this.avatar})
      : assert(id != null && firstName != null && lastName != null && avatar != null);

  factory User.fromJson(Map<String, dynamic> json) {
    var u =  User(
      id: json['_id'],
      firstName: json['name']['first'],
      lastName: json['name']['last'],
      avatar: json['picture'],
    );
    u._email = json['email'];
    u._phone = json['phone'];
    u._about = json['about'];
    u._age = json['age'];
    return u;
  }
}
