import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:vaultapp/app/modules/items/data/models/movie.dart';

class MovieDetails extends StatelessWidget {
  const MovieDetails({Key? key, required this.movie}) : super(key: key);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 7.h,
        ),
        Text("Directeur : ${movie.director}", style: const TextStyle(fontSize: 20)),
        SizedBox(
          height: 7.h,
        ),
        Text("Distributeur : ${movie.editor}", style: const TextStyle(fontSize: 20)),
        SizedBox(
          height: 3.h,
        ),
        const Icon(Icons.movie)
      ],
    );
  }
}
