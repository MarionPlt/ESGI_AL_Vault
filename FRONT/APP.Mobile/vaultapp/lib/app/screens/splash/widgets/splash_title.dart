import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SplashTitle extends StatelessWidget {
  const SplashTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "Vault Demo",
      style: TextStyle(fontSize: 5.h),
    );
  }
}
