import 'package:flutter/material.dart';

class Guide {
  // ignore: unused_field
  int _id;
  String _username;
  String _password;

  final String name, image;
  Guide({@required this.name, @required this.image});

  // Guide(this._username, this._password);
  // Guide.fromMap(dynamic obj) {
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
List<Guide> topGuides = [guide1, guide2, guide3, guide4];

// demo guide
Guide guide1 = Guide(name: "James", image: "assets/images/james.png");
Guide guide2 = Guide(name: "John", image: "assets/images/John.png");
Guide guide3 = Guide(name: "Marry", image: "assets/images/marry.png");
Guide guide4 = Guide(name: "Rosy", image: "assets/images/rosy.png");
Guide guide5 = Guide(name: "Rapid", image: "assets/images/profile.jpg");
