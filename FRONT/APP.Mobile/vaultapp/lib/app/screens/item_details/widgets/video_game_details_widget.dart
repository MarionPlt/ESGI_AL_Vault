import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:sizer/sizer.dart';
import 'package:vaultapp/app/modules/items/data/models/video_game.dart';

class VideoGameDetails extends StatelessWidget {
  const VideoGameDetails({Key? key, required this.videoGame}) : super(key: key);

  final VideoGame videoGame;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 7.h,
        ),
        Text(videoGame.platform),
        SizedBox(
          height: 3.h,
        ),
        const Icon(Icons.gamepad)
      ],
    );
  }
}
