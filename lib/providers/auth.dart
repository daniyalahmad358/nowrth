import 'dart:async';
import 'dart:convert';

import 'package:flutter/widgets.dart';
// import 'package:nowrth/utils/api.dart';
import 'package:nowrth/utils/http_exception.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'api_provider.dart';

class Auth with ChangeNotifier {
  // var authKey = Api.authKey;
  ApiProvider apiProvider = ApiProvider();

  String? _token;
  String? _userId;
  // String? _userEmail;
  // DateTime? _expiryDate;
  Timer? _authTimer;

  Future<bool> get isAuth async {
    var auth = false;
    auth = await tryautoLogin();
    return auth;
  }

  // String? get token {
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
  Future<void> logout() async {
    _token = null;
    // _userEmail = null;
    _userId = null;
    // _expiryDate = null;
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
    // final timetoExpiry = _expiryDate!.difference(DateTime.now()).inSeconds;
    // _authTimer = Timer(Duration(seconds: timetoExpiry), logout);
  }

  Future<bool> tryautoLogin() async {
    final pref = await SharedPreferences.getInstance();
    if (!pref.containsKey('userData')) {
      return false;
    }

    // final extractedUserData = json.decode(pref.getString('userData') as String)
    //     as Map<String, dynamic>;

    Map<String, dynamic> extractedUserData = Map<String, dynamic>.from(
        json.decode(pref.getString('userData') as String));

    // final expiryDate =
    // DateTime.parse(extractedUserData['expiryDate'] as String);
    // if (expiryDate.isBefore(DateTime.now())) {
    // return false;
    // }
    _token = extractedUserData['token'] as String;
    _userId = extractedUserData['userId'] as String?;
    // _userEmail = extractedUserData['userEmail'] as String?;
    // _expiryDate = expiryDate;
    // notifyListeners();
    _autologout();

    return true;
  }

  Future<bool?> authentication(
    String email,
    String password,
    String endpoint,
  ) async {
    try {
      final url = 'authentication/$endpoint';

      final response = await apiProvider.post(
        url: url,
        body: {
          'userName': email,
          'email': email,
          'password': password,
        },
      );
      if (response.body.isNotEmpty) {
        final responseData = json.decode(response.body);
        if (responseData['error'] != null) {
          throw HttpException(responseData['error']['message']);
        }
        _token = responseData['token'];
        _userId = responseData['userId'];
        // _expiryDate = DateTime.now()
        // .add(Duration(seconds: int.parse(responseData['expiresIn'])));

        _autologout();
        notifyListeners();

        final prefs = await SharedPreferences.getInstance();
        final userData = json.encode(
          {
            'token': _token,
            'userId': _userId,
            // 'expiryDate': _expiryDate!.toIso8601String(),
          },
        );

        prefs.setString('userData', userData);
      } else {
        throw Exception('Error: Empty Response Body');
      }
    } catch (e) {
      rethrow;
    }
    return true;
  }

  Future<bool?> login(String email, String password) {
    return authentication(email, password, 'login');
  }

  Future<void> signUp(String email, String password) {
    return authentication(email, password, 'register');
  }
}
