import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sjm/bloc/firebase_service.dart';
import 'package:sjm/common/pref/helper.dart';
import 'package:sjm/common/pref/preferences.dart';
import 'package:sjm/data/models/user_model.dart';
import 'package:sjm/data/repositories/user_repo.dart';

final preferencesProvider = Provider<Preference>((ref) {
  return Preference();
});

final sharedPrefHelperProvider = Provider<SharedPreferenceHelper>((ref) {
  return SharedPreferenceHelper(ref.read(preferencesProvider));
});

final authServiceProvider = Provider<AuthService>((ref) {
  return AuthService();
});

final userRepositoryProvider = Provider<UserRepository>((ref) {
  return UserRepository();
});

final userProvider = StateProvider<User?>((ref) => null);
