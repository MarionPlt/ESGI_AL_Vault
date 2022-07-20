import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:vaultapp/app/app_routes.dart';
import 'package:vaultapp/app/modules/items/bloc/item_bloc.dart';
import 'package:vaultapp/app/modules/items/data/models/book.dart';
import 'package:vaultapp/app/modules/items/data/models/video_game.dart';
import 'package:vaultapp/app/screens/add_user_item/add_user_item_screen.dart';
import 'package:vaultapp/app/screens/user_item_details/informations_card.dart';
import 'package:vaultapp/app/screens/user_items/state_chips.dart';
import 'package:vaultapp/app/screens/user_items/type_chips.dart';

import '../../../core/di/locator.dart';
import '../../modules/items/data/models/movie.dart';

class UserItemDetailsScren extends StatelessWidget {
  const UserItemDetailsScren({Key? key, required this.itemId})
      : super(key: key);

  final String itemId;

  @override
  Widget build(BuildContext context) {
    final ItemBloc itemBloc = locator<ItemBloc>();
    itemBloc.add(GetUserItemEvent(itemId));

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
          title: const Text(
            "Détails",
            style: TextStyle(fontSize: 20),
          ),
          automaticallyImplyLeading: true),
      body: BlocBuilder<ItemBloc, ItemState>(builder: (context, state) {
        if (state is GetUserItemSuccessState) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: SizedBox(
                    height: 20.h,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Builder(builder: (context) {
                          if (state.userItem.item.imageURL != null &&
                              state.userItem.item.imageURL != "") {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                  height: 18.h,
                                  width: 18.h,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.network(
                                        state.userItem.item.imageURL!,
                                        errorBuilder: (context, url, error) {
                                      return const Icon(
                                          Icons.image_not_supported);
                                    }),
                                  )),
                            );
                          }
                          return SizedBox(
                              height: 20.h,
                              width: 20.h,
                              child: const Icon(Icons.image_not_supported));
                        }),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 45.w,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Flexible(
                                      child: Text(state.userItem.item.label,
                                          style: const TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  Wrap(
                                    direction: Axis.horizontal,
                                    spacing: -8.0,
                                    children: [
                                      TypeChips(type: state.userItem.item.type),
                                      StateChips(state: state.userItem.state),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Builder(builder: (context) {
                if (state.userItem.item.type == "VideoGame") {
                  return InformationsCard(
                      item: state.userItem.item as VideoGame);
                }
                if (state.userItem.item.type == "Book") {
                  return InformationsCard(item: state.userItem.item as Book);
                }
                if (state.userItem.item.type == "Movie") {
                  return InformationsCard(item: state.userItem.item as Movie);
                }
                return Container();
              }),
            ],
          );
        } else if (state is ItemLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return Container();
        }
      }),
      floatingActionButton:
          BlocBuilder<ItemBloc, ItemState>(builder: (context, state) {
        if (state is GetUserItemSuccessState) {
          if (!state.isOffline) {
            return FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AddUserItemScreen(
                            item: state.userItem.item,
                            isUpdate: true,
                            userItem: state.userItem,
                          )),
                );
              },
              child: const Icon(Icons.edit),
            );
          }
        }
        return Container();
      }),
    );
  }
}
