import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sjm/common/pref/helper.dart';
import 'package:sjm/common/pref/preferences.dart';

final preferencesProvider = Provider<Preference>((ref) {
  return Preference();
});

final sharedPrefHelperProvider = Provider<SharedPreferenceHelper>((ref) {
  return SharedPreferenceHelper(ref.read(preferencesProvider));
});
