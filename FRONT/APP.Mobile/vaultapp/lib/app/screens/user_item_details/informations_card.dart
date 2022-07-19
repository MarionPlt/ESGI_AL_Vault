import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:vaultapp/app/modules/items/data/models/book.dart';
import 'package:vaultapp/app/modules/items/data/models/movie.dart';
import 'package:vaultapp/app/modules/items/data/models/video_game.dart';

import '../../modules/items/data/models/item.dart';

class InformationsCard extends StatelessWidget {
  const InformationsCard({Key? key, required this.item}) : super(key: key);

  final Book item;

 

  @override
  Widget build(BuildContext context) {
    print(item);
    return Text('TOTO');
  }
}
