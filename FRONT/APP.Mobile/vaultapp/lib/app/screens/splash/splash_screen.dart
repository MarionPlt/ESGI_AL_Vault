import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vaultapp/app/app_routes.dart';
import 'package:vaultapp/app/modules/auth/bloc/auth_bloc.dart';
import 'package:vaultapp/app/screens/splash/widgets/splash_title.dart';
import 'package:vaultapp/core/di/locator.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthBloc authBloc = locator<AuthBloc>();

    authBloc.add(ReconnectionRequested());

    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is Authenticated) {
          Timer(const Duration(seconds: 2), () {
            Navigator.pushReplacementNamed(context, homeScreen);
          });
        } else {
          Timer(const Duration(seconds: 2), () {
            Navigator.pushReplacementNamed(context, loginScreen);
          });
        }
      },
      child: const Scaffold(
        body: Center(
          child: SplashTitle(),
        ),
      ),
    );
  }
}
