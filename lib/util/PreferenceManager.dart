import 'package:shared_preferences/shared_preferences.dart';

class PreferenceManager {
  static const ACCEPT_CGU = "acceptCGU";
  static const NAME = "name";
  static const EMAIl = "email";
  static const PHONE = "phone";
  static const PASSWORD = "password";
  static const ISLOGGED = "isLogged";
  static const FAVORITE_IMAGES = "favoriteImages";

  static final PreferenceManager _instance = PreferenceManager._();
  late SharedPreferences prefs;

  PreferenceManager._();

  static PreferenceManager get instance => _instance;

  Future<void> initPreferences() async {
    prefs = await SharedPreferences.getInstance();
  }

  // Basic Operation
  Future<bool?> isLoggedIn() async {
    return prefs.getBool(ISLOGGED);
  }

  Future<void> setBool(String key, bool value) async {
    prefs.setBool(key, value);
  }

  bool getBool(String key) {
    return prefs.getBool(key) ?? false;
  }

  Future<void> setString(String key, String value) async {
    prefs.setString(key, value);
  }

  String getString(String key) {
    return prefs.getString(key) ?? "";
  }

  List<String> getFavoriteImages() {
    return prefs.getStringList(FAVORITE_IMAGES) ?? [];
  }

  Future<void> setFavoriteImages(List<String> images) async {
    prefs.setStringList(FAVORITE_IMAGES, images);
  }
}
