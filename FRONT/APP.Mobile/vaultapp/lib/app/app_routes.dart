import 'package:flutter/cupertino.dart';
import 'package:vaultapp/app/screens/home/home_screen.dart';
import 'package:vaultapp/app/screens/login/login_screen.dart';
import 'package:vaultapp/app/screens/splash/splash_screen.dart';
import 'package:vaultapp/app/screens/user_items/user_item_screen.dart';

const splashScreen = "/splash";
const loginScreen = "/login";
const registerScreen = "/register";
const homeScreen = "/home";
const userItemsScreen = "/userItems";

Map<String, WidgetBuilder> routes = {
  splashScreen: (context) => const SplashScreen(),
  loginScreen: (context) => const LoginScreen(),
  homeScreen: (context) => const HomeScreen(),
  userItemsScreen: (context) => const UserItemScreen(),
};
