import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:vaultapp/app/app_routes.dart';
import 'package:vaultapp/app/modules/auth/bloc/auth_bloc.dart';
import 'package:vaultapp/app/screens/home/home_screen.dart';
import 'package:vaultapp/app/screens/login/login_screen.dart';
import 'package:vaultapp/app/screens/splash/splash_screen.dart';
import 'package:vaultapp/assets/theme.dart';
import 'package:vaultapp/core/di/locator.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, devideType) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Vault',
        theme: vaultAppTheme,
        routes: routes,
        builder: (_, widget) {
          return MultiBlocProvider(providers: [
            BlocProvider<AuthBloc>(
              create: (_) => locator<AuthBloc>(),
            )
          ], child: widget ?? Container());
        },
        initialRoute: splashScreen,
      );
    });
  }
}
