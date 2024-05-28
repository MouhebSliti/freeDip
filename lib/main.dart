
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:mouheb/CategoryScreen.dart';
import 'package:mouheb/util/PreferenceManager.dart';
import 'ForgetPassword.dart';
import 'Login.dart';
import 'SignUp.dart';
import 'HomeScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PreferenceManager.instance.initPreferences();

  bool loggedIn = (await PreferenceManager.instance.isLoggedIn()) ?? false;
  String initialRoute = loggedIn ? 'homeScreen' : 'login';

  runApp(MyApp(
    initialRoute: initialRoute,
  ));

  // Feature Flutter Native Splash
  FlutterNativeSplash.remove();
}

class MyApp extends StatelessWidget {
  final String initialRoute;

  const MyApp({Key? key, required this.initialRoute}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: initialRoute,
      routes: {
        "login": (context) => Login(),
        "signUp": (context) => SignUp(),
        "forgetPassword": (context) => ForgetPassword(),
        "categoryScreen": (context) => CategoryScreen(),
        "homeScreen": (context) => HomeScreen(),
      },
    );
  }
}
