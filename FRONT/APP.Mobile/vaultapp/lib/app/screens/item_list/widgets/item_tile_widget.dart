import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'package:vaultapp/app/modules/items/data/models/item.dart';
import 'package:vaultapp/app/screens/item_details/item_details_screen.dart';

class ItemTile extends StatelessWidget {
  const ItemTile({Key? key, required this.item}) : super(key: key);

  final Item item;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        splashColor: Colors.blue.withAlpha(30),
        onTap: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => ItemDetailsScreen(itemId: item.id!)),
          );
        },
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Builder(
            builder: (context) {
              if (item.imageURL != null && item.imageURL != "") {
                return SizedBox(
                    height: 10.h,
                    width: 10.h,
                    child: Image(image: NetworkImage(item.imageURL!)));
              } else {
                return SizedBox(
                  height: 10.h,
                  width: 10.h,
                );
              }
            },
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(item.label),
              Text(
                  "Date de sortie : ${DateFormat.yMd('fr_FR').format(item.releaseDate)}")
            ],
          ),
          Text(item.type)
        ]),
      ),
    );
  }
}
