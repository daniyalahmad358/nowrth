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
