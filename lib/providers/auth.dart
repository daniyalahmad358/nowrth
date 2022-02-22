import 'dart:async';
import 'dart:convert';

import 'package:flutter/widgets.dart';
// import 'package:nowrth/utils/api.dart';
import 'package:nowrth/utils/http_exception.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'api_provider.dart';

abstract class Auth with ChangeNotifier {
  // static var authKey = Api.authKey;
  // static String? _userEmail;
  // static DateTime? _expiryDate;

  // static String? get token {
  //   if (_expiryDate != null &&
  //       _expiryDate!.isAfter(DateTime.now()) &&
  //       _token != null) {
  //     return _token!;
  //   }
  //   return null;
  // }
  // String get userId {
  //   return _userId!;
  // }
  // String get userEmail {
  //   return _userEmail!;
  // }

  static String? _token;
  static String? _userId;
  static Timer? _authTimer;

  static Future<bool> get isAuth async {
    var auth = false;
    auth = await tryAutoLogin();
    return auth;
  }

  static Future<void> logout() async {
    _token = null;
    // _userEmail = null;
    _userId = null;
    // _expiryDate = null;
    if (_authTimer != null) {
      _authTimer!.cancel();
      _authTimer = null;
    }
    // notifyListeners();
    final pref = await SharedPreferences.getInstance();
    pref.clear();
  }

  static void _autoLogout() {
    if (_authTimer != null) {
      _authTimer!.cancel();
    }
    // final timeToExpiry = _expiryDate!.difference(DateTime.now()).inSeconds;
    // _authTimer = Timer(Duration(seconds: timeToExpiry), logout);
  }

  static Future<bool> tryAutoLogin() async {
    final pref = await SharedPreferences.getInstance();
    if (!pref.containsKey('userData')) {
      return false;
    } else {
      // final extractedUserData = json.decode(pref.getString('userData') as String)
      //     as Map<String, dynamic>;

      Map<String, dynamic> extractedUserData = Map<String, dynamic>.from(
          json.decode(pref.getString('userData') as String));

      // final expiryDate =
      // DateTime.parse(extractedUserData['expiryDate'] as String);
      // if (expiryDate.isBefore(DateTime.now())) {
      // return false;
      // }
      _token = extractedUserData['token'] as String?;
      _userId = extractedUserData['userId'] as String?;

      if (_token == null || _userId == null) {
        return false;
      } else {
        // _expiryDate = expiryDate;
        // notifyListeners();
        _autoLogout();
      }
    }
    return true;
  }

  static Future<bool?> authentication(
    String email,
    String password,
    String endpoint,
  ) async {
    try {
      final url = 'authentication/$endpoint';

      final response = await ApiProvider.post(
        url: url,
        body: {
          'userName': email,
          'email': email,
          'password': password,
        },
      );
      final responseData = json.decode(response.body);
      if (responseData['error'] != null) {
        throw HttpException(responseData['error']['message']);
      }
      _token = responseData['token'];
      _userId = responseData['userId'];
      _autoLogout();
      // _expiryDate = DateTime.now()
      // .add(Duration(seconds: int.parse(responseData['expiresIn'])));
      // notifyListeners();

      final prefs = await SharedPreferences.getInstance();
      final userData = json.encode(
        {
          'token': _token,
          'userId': _userId,
          // 'expiryDate': _expiryDate!.toIso8601String(),
        },
      );

      prefs.setString('userData', userData);
    } catch (e) {
      rethrow;
    }
    return true;
  }

  static Future<bool?> login(String email, String password) {
    return authentication(email, password, 'login');
  }

  static Future<bool?> signUp(
      {required String firstName,
      required String lastName,
      required String email,
      required String password}) {
    return authentication(email, password, 'register');
  }
}
