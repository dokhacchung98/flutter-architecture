import 'package:flutter/foundation.dart';

class User {
  String id;
  String firstName;
  String lastName;
  String avatar;

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
    return u;
  }
}
