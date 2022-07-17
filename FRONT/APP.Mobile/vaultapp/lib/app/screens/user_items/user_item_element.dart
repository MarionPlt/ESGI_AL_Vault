// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:vaultapp/app/app_routes.dart';
import 'package:intl/intl.dart';
import 'package:vaultapp/app/modules/items/data/models/user_item.dart';
import 'package:vaultapp/app/screens/user_item_details/user_item_details_screen.dart';
import 'package:vaultapp/app/screens/user_items/state_chips.dart';
import 'package:vaultapp/app/screens/user_items/type_chips.dart';

class ListElement extends StatelessWidget {
  const ListElement({
    Key? key,
    required this.userItem,
  }) : super(key: key);

  final UserItem userItem;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => UserItemDetailsScren(itemId: userItem.id!)),
          );
      }),
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10, 10, 10, 10),
                                  child: Builder(builder: (context) {
                                    if (userItem.item.imageURL != null &&
                                        userItem.item.imageURL != "") {
                                      return SizedBox(
                                          child: Image.network(
                                              userItem.item.imageURL!,
                                              errorBuilder:
                                                  (context, url, error) {
                                            return const Icon(
                                                Icons.image_not_supported);
                                          }));
                                    }
                                    return SizedBox(
                                        child: const Icon(
                                            Icons.image_not_supported));
                                  }),
                                ),
                              ),
                              Container(
                                height: 110,
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 5),
                                      child: Text(userItem.item.label,
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                    TypeChips(type: userItem.item.type),
                                    StateChips(state: userItem.state),
                                    Text('Support : ${userItem.item.support}',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text('Date d\'aquisition : ',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                  Text(DateFormat('dd/MM/yyyy').format(userItem.acquisitionDate),
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.normal)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
