import 'package:flutter/material.dart';
import 'package:vaultapp/app/app_routes.dart';

class CreateItemScreen extends StatelessWidget {
  const CreateItemScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Création"),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              child: const Icon(Icons.close),
              onTap: () {
                Navigator.pushReplacementNamed(context, itemListScreen);
              },
            ),
          )
        ]),
        body: Center(
          child: Column(
            children: [
              const Text("Que souhaitez-vous créer ?"),
              TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, createBookScreen);
                  },
                  child: const Text("Un livre")),
              TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, createMovieScreen);
                  },
                  child: const Text("Un film")),
              TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, createVideoGameScreen);
                  },
                  child: const Text("Un jeu vidéo")),
            ],
          ),
        ));
  }
}
