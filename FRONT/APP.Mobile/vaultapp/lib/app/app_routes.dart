import 'package:flutter/cupertino.dart';
import 'package:vaultapp/app/screens/home/home_screen.dart';
import 'package:vaultapp/app/screens/login/login_screen.dart';
import 'package:vaultapp/app/screens/splash/splash_screen.dart';

const splashScreen = "/splash";
const loginScreen = "/login";
const registerScreen = "/register";
const homeScreen = "/home";

Map<String, WidgetBuilder> routes = {
  splashScreen: (context) => const SplashScreen(),
  loginScreen: (context) => const LoginScreen(),
  homeScreen: (context) => const HomeScreen()
};
