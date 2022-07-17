import 'package:flutter/cupertino.dart';
import 'package:vaultapp/app/screens/create_item/create_book_screen.dart';
import 'package:vaultapp/app/screens/create_item/create_item_screen.dart';
import 'package:vaultapp/app/screens/create_item/create_movie_screen.dart';
import 'package:vaultapp/app/screens/create_item/create_video_game_screen.dart';
import 'package:vaultapp/app/screens/home/home_screen.dart';
import 'package:vaultapp/app/screens/item_list/item_list_screen.dart';
import 'package:vaultapp/app/screens/login/login_screen.dart';
import 'package:vaultapp/app/screens/splash/splash_screen.dart';
import 'package:vaultapp/app/screens/user_items/user_item_screen.dart';

const splashScreen = "/splash";
const loginScreen = "/login";
const registerScreen = "/register";
const homeScreen = "/home";
const userItemsScreen = "/userItems";
const userItemDetail = "/userItemDetail";
const itemListScreen = "/items";
const createItemScreen = "/additem";
const createMovieScreen = "/addmovie";
const createBookScreen = "/addbook";
const createVideoGameScreen = "/addvideogame";

Map<String, WidgetBuilder> routes = {
  splashScreen: (context) => const SplashScreen(),
  loginScreen: (context) => const LoginScreen(),
  homeScreen: (context) => const HomeScreen(),
  userItemsScreen: (context) => const UserItemScreen(),
  itemListScreen: (context) => const ItemListScreen(),
  createItemScreen: (context) => const CreateItemScreen(),
  createBookScreen: (context) => const CreateBookScreen(),
  createMovieScreen: (context) => const CreateMovieScreen(),
  createVideoGameScreen: (context) => const CreateVideoGameScreen()
};
