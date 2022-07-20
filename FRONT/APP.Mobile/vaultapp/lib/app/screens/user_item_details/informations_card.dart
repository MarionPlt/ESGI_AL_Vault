import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:vaultapp/app/modules/items/data/models/book.dart';
import 'package:vaultapp/app/modules/items/data/models/movie.dart';
import 'package:vaultapp/app/modules/items/data/models/video_game.dart';

import '../../modules/items/data/models/item.dart';

class InformationsCard extends StatelessWidget {
  const InformationsCard({Key? key, required this.item}) : super(key: key);

  final dynamic item;

  Widget caract(dynamic item) {
    List<Map<String, String>> detail = [];

    Map<String, String> traduction = {
      "id": "Identifiant",
      "label": "Titre",
      "type": "Type",
      "releaseDate": "Date de sortie",
      "support": "Support",
      "editor": "Editor",
      "authors": "Auteur",
      "volume": "Volume"
    };

    String translate(String key) {
      if (traduction.containsKey(key)) {
        return traduction[key]!;
      } else {
        return key;
      }
    }

    item.toJson().forEach((key, value) {
      if (value != null && value.length > 0) {
        String cle = translate(key);
        detail.add({key: value});
      }
    });

    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: detail
            .map((item) => Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: RichText(
                    text: TextSpan(
                      style: TextStyle(color: Colors.black, fontSize: 14),
                      children: <TextSpan>[
                        TextSpan(
                            text: translate(item.keys.toList().first),
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(text: ' : '),
                        TextSpan(
                          text: item.values.toList().first,
                        )
                      ],
                    ),
                  ),
                ))
            .toList());
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Card(
        // ignore: prefer_const_literals_to_create_immutables
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Center(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Caractéristiques',
                  style: TextStyle(fontSize: 19),
                ),
              ),
            ),
            caract(item)
          ]),
        ),
      ),
    );
  }
}
