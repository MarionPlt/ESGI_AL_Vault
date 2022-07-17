import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vaultapp/app/app_routes.dart';
import 'package:vaultapp/app/modules/items/bloc/item_bloc.dart';
import 'package:vaultapp/app/screens/user_items/state_chips.dart';
import 'package:vaultapp/app/screens/user_items/type_chips.dart';

import '../../../core/di/locator.dart';

class UserItemDetailsScren extends StatelessWidget {
  const UserItemDetailsScren({Key? key, required this.itemId})
      : super(key: key);

  final String itemId;

  @override
  Widget build(BuildContext context) {
    final ItemBloc itemBloc = locator<ItemBloc>();
    itemBloc.add(GetUserItemEvent(itemId));

    return BlocBuilder<ItemBloc, ItemState>(
      builder: ((context, state) {
        if (state is GetUserItemSuccessState) {
          return Scaffold(
            appBar: AppBar(
                actions: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      child: const Icon(Icons.close),
                      onTap: () {
                        Navigator.pushReplacementNamed(context, userItemsScreen);
                      },
                    ),
                  )
                ],
                title: Text(
                  state.userItem.item.label,
                  style: const TextStyle(fontSize: 20),
                ),
                automaticallyImplyLeading: true),
            body: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                // Generated code for this Column Widget...
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 150,
                        decoration: BoxDecoration(
                          color: Color(0xFFEEEEEE),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Builder(builder: (context) {
                              if (state.userItem.item.imageURL != null &&
                                  state.userItem.item.imageURL != "") {
                                return Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 10, 0),
                                    child: Image.network(state.userItem.item.imageURL!,
                                        errorBuilder: (context, url, error) {
                                      return const Icon(
                                          Icons.image_not_supported);
                                    }));
                              }
                              return Container(
                                width: 20,
                                child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 10, 0),
                                    child: const Icon(Icons.image_not_supported)),
                              );
                            }),
                            Container(
                              width: 210,
                              height: MediaQuery.of(context).size.height * 1,
                              decoration: BoxDecoration(
                                color: Color(0xFFEEEEEE),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Text('Hello World gergergregegerg'),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      StateChips(state: state.userItem.state),
                                      TypeChips(type: state.userItem.item.type)
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
                      child: const Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        color: Color(0xFFF5F5F5),
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        } else {
          return Container();
        }
      }),
    );
  }
}
