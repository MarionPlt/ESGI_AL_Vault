import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
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
            Row(
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
                            SizedBox(
                              width: 30.w,
                              height: 10.h,
                              child: Builder(builder: (context) {
                                if (userItem.item.imageURL != null &&
                                    userItem.item.imageURL != "") {
                                  return SizedBox(
                                      child: Image.network(
                                          userItem.item.imageURL!,
                                          errorBuilder: (context, url, error) {
                                    return const Icon(
                                        Icons.image_not_supported);
                                  }));
                                }
                                return const SizedBox(
                                    child: Icon(Icons.image_not_supported));
                              }),
                            ),
                            SizedBox(
                              width: 67.5.w,
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Flexible(
                                        fit: FlexFit.loose,
                                        flex: 10,
                                        child: Text(userItem.item.label,
                                            style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold)),
                                      ),
                                      const Spacer(),
                                      SizedBox(
                                        width: 25.w,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Center(
                                              child: Column(
                                                children: [
                                                  const Text(
                                                      'Date d\'aquisition',
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                  Text(
                                                      DateFormat('dd/MM/yyyy')
                                                          .format(userItem
                                                              .acquisitionDate),
                                                      style: const TextStyle(
                                                          fontSize: 12,
                                                          fontWeight: FontWeight
                                                              .normal)),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 10, 0, 0),
                                    child: Column(
                                      children: [
                                        Wrap(
                                          direction: Axis.vertical,
                                          runSpacing: 3.0,
                                          children: [
                                            TypeChips(type: userItem.item.type),
                                            StateChips(state: userItem.state),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
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
          ],
        ),
      ),
    );
  }
}
