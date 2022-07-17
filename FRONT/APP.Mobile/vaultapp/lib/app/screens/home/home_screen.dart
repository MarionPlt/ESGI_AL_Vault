import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vaultapp/app/app_routes.dart';
import 'package:vaultapp/app/modules/auth/bloc/auth_bloc.dart';
import 'package:vaultapp/app/screens/home/widgets/home_tile.dart';
import 'package:vaultapp/core/di/locator.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthBloc authBloc = locator<AuthBloc>();
    return BlocListener<AuthBloc, AuthState>(
      listener: ((context, state) => {
            if (state is UnAuthenticated)
              {Navigator.pushReplacementNamed(context, loginScreen)}
          }),
      child: Scaffold(
        appBar: AppBar(title: const Text("Accueil")),
        body: Container(
          color: Colors.white,
          child: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        HomeTile(
                            label: "Gérer mes objets possédés",
                            route: userItemsScreen),
                        HomeTile(
                            label: "Gérer mes collections", route: homeScreen),
                      ]),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        HomeTile(
                            label: "Chercher de nouveaux objets",
                            route: itemListScreen),
                        HomeTile(label: "à suivre ...", route: homeScreen),
                      ]),
                  TextButton(
                      onPressed: () {
                        authBloc.add(SignOutRequested());
                      },
                      child: const Text("Déconnexion"))
                ]),
          ),
        ),
      ),
    );
  }
}
