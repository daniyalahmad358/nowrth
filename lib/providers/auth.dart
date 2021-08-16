import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:nowrth/utils/api.dart';
import 'package:http/http.dart' as http;
import 'package:nowrth/utils/http_exception.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Auth with ChangeNotifier {
  var mainUrl = Api.authUrl;
  var authKey = Api.authKey;

  String? _token;
  String? _userId;
  String? _userEmail;
  DateTime? _expiryDate;
  Timer? _authTimer;

  bool get isAuth {
    return token != null;
  }

  String? get token {
    if (_expiryDate != null &&
        _expiryDate!.isAfter(DateTime.now()) &&
        _token != null) {
      return _token!;
    }
    return null;
  }

  String get userId {
    return _userId!;
  }

  String get userEmail {
    return _userEmail!;
  }

  Future<void> logout() async {
    _token = null;
    _userEmail = null;
    _userId = null;
    _expiryDate = null;

    if (_authTimer != null) {
      _authTimer!.cancel();
      _authTimer = null;
    }

    notifyListeners();

    final pref = await SharedPreferences.getInstance();
    pref.clear();
  }

  void _autologout() {
    if (_authTimer != null) {
      _authTimer!.cancel();
    }
    final timetoExpiry = _expiryDate!.difference(DateTime.now()).inSeconds;
    _authTimer = Timer(Duration(seconds: timetoExpiry), logout);
  }

  Future<bool> tryautoLogin() async {
    final pref = await SharedPreferences.getInstance();
    if (!pref.containsKey('userData')) {
      return false;
    }

    final extractedUserData = json.decode(pref.getString('userData') as String)
        as Map<String, Object>;

    final expiryDate =
        DateTime.parse(extractedUserData['expiryDate'] as String);
    if (expiryDate.isBefore(DateTime.now())) {
      return false;
    }
    _token = extractedUserData['token'] as String?;
    _userId = extractedUserData['userId'] as String?;
    _userEmail = extractedUserData['userEmail'] as String?;
    _expiryDate = expiryDate;
    notifyListeners();
    _autologout();

    return true;
  }

  Future<void> authentication(
      String email, String password, String endpoint) async {
    try {
      final url = '$mainUrl/accounts:$endpoint?key=$authKey';

      final responce = await http.post(Uri.parse(url),
          body: json.encode({
            'email': email,
            'password': password,
            'returnSecureToken': true
          }));

      final responceData = json.decode(responce.body);
      print(responceData);
      if (responceData['error'] != null) {
        throw HttpException(responceData['error']['message']);
      }
      _token = responceData['idToken'];
      _userId = responceData['localId'];
      _userEmail = responceData['email'];
      _expiryDate = DateTime.now()
          .add(Duration(seconds: int.parse(responceData['expiresIn'])));

      _autologout();
      notifyListeners();

      final prefs = await SharedPreferences.getInstance();
      final userData = json.encode({
        'token': _token,
        'userId': _userId,
        'userEmail': _userEmail,
        'expiryDate': _expiryDate!.toIso8601String(),
      });

      prefs.setString('userData', userData);

      print('check' + userData.toString());
    } catch (e) {
      throw e;
    }
  }

  Future<void> login(String email, String password) {
    return authentication(email, password, 'signInWithPassword');
  }

  Future<void> signUp(String email, String password) {
    return authentication(email, password, 'signUp');
  }
}
