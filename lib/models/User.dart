import 'package:flutter/material.dart';

class User {
  // ignore: unused_field
  int _id;
  String _username;
  String _password;

  final String name, image;
  User({@required this.name, @required this.image});

  // User(this._username, this._password);
  // User.fromMap(dynamic obj) {
  //   this._username = obj['username'];
  //   this._password = obj['password'];
  // }

  String get username => _username;
  String get password => _password;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["username"] = _username;
    map["password"] = _password;
    return map;
  }
}

// Demo List of Top Guides
List<User> topGuides = [user1, user2, user3, user4];

// demo user
User user1 = User(name: "James", image: "assets/images/james.png");
User user2 = User(name: "John", image: "assets/images/John.png");
User user3 = User(name: "Marry", image: "assets/images/marry.png");
User user4 = User(name: "Rosy", image: "assets/images/rosy.png");
