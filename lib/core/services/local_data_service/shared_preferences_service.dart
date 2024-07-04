import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  SharedPreferences? _sharedPreferences;

  Future<bool> saveAcessKey(
      { required String acessKey}) async {
    _sharedPreferences = await SharedPreferences.getInstance();

    return _sharedPreferences!.setString("key", acessKey);
  }

  Future<String?> readAcessKey() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    final value = _sharedPreferences!.getString("key");
    if (value == null || value.isEmpty) {
      return null;
    } else {
      return value;
    }
  }

  Future<bool> deleteData() async {
    _sharedPreferences = await SharedPreferences.getInstance();

    return _sharedPreferences!.remove("key");
  }
}