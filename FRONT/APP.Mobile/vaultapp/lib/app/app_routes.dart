import 'package:flutter/cupertino.dart';
import 'package:vaultapp/app/screens/login/login_screen.dart';
import 'package:vaultapp/app/screens/splash/splash_screen.dart';

const splashScreen = "/splash";
const loginScreen = "/login";
const registerScreen = "/register";

Map<String, WidgetBuilder> routes = {
  splashScreen: (context) => const SplashScreen(),
  loginScreen: (context) => const LoginScreen()
};
