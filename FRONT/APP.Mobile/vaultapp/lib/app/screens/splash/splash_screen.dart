import 'package:flutter/material.dart';
import 'package:vaultapp/app/app_routes.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.pushReplacementNamed(context, splashScreen);
        },
        child: Container());
  }
}
