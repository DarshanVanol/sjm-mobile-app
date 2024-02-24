import 'dart:async';
import 'dart:convert';

import 'package:sjm/common/pref/preferences.dart';
import 'package:sjm/data/models/user_model.dart';

class SharedPreferenceHelper {
  final Preference _sharedPreference;

  const SharedPreferenceHelper(this._sharedPreference);

  // General Methods: ----------------------------------------------------------
  Future<void> saveAuthToken(String authToken) async {
    await _sharedPreference.setString(PrefKeys.authToken, authToken);
  }

  Future<void> saveIsProfileComplete(bool value) async {
    await _sharedPreference.setBool(PrefKeys.isProfileComplete, value);
  }

  bool? get isProfileComplete {
    return _sharedPreference.getBool(PrefKeys.isProfileComplete);
  }

  String? get authToken {
    return _sharedPreference.getString(PrefKeys.authToken);
  }

  Future<bool> removeAuthToken() async {
    return _sharedPreference.remove(PrefKeys.authToken);
  }

  Future<void> saveIsLoggedIn(bool value) async {
    await _sharedPreference.setBool(PrefKeys.isLoggedIn, value);
  }

  bool get isLoggedIn {
    return _sharedPreference.getBool(PrefKeys.isLoggedIn) ?? false;
  }

  Future<void> saveUserName(String name) async {
    await _sharedPreference.setString(PrefKeys.userName, name);
  }

  String? get userName {
    return _sharedPreference.getString(PrefKeys.userName);
  }

  Future<void> saveUserEmail(String email) async {
    await _sharedPreference.setString(PrefKeys.email, email);
  }

  String? get userEmail {
    return _sharedPreference.getString(PrefKeys.email);
  }

  Future<void> saveUser(User user) async {
    final String userString = user.toJson().toString();
    print("userString: $userString");
    await _sharedPreference.setString(PrefKeys.user, userString);
  }

  User? get user {
    final user = _sharedPreference.getString(PrefKeys.user);
    print("user pref: $user");
    if (user != null) {
      return User.fromJson(jsonDecode(user));
    }
    return null;
  }

  Future<void> clear() async {
    await _sharedPreference.clear();
  }
}

mixin PrefKeys {
  static const String isLoggedIn = "isLoggedIn";
  static const String isProfileComplete = "isProfileComplete";
  static const String authToken = "authToken";
  static const String userName = "userName";
  static const String email = "email";
  static const String user = "user";
}
