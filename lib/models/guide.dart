class Guide {
  // ignore: unused_field
  // int? _id;
  String? _username;
  String? _password;

  final String name, image;
  Guide({required this.name, required this.image});

  // Guide(this._username, this._password);
  // Guide.fromMap(dynamic obj) {
  //   this._username = obj['username'];
  //   this._password = obj['password'];
  // }

  // TODO: remove ? to make these non-nullable
  String? get username => _username;
  String? get password => _password;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["username"] = _username;
    map["password"] = _password;
    return map;
  }
}

// Demo List of Top Guides
List<Guide> topGuides = [guide0, guide1, guide2, guide3];

// demo guide
Guide guide0 = Guide(name: "James", image: "assets/images/james.png");
Guide guide1 = Guide(name: "John", image: "assets/images/John.png");
Guide guide2 = Guide(name: "Marry", image: "assets/images/marry.png");
Guide guide3 = Guide(name: "Rosy", image: "assets/images/rosy.png");
Guide guide4 = Guide(name: "Rapid", image: "assets/images/profile.jpg");
