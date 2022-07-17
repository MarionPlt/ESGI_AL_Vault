import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vaultapp/app/modules/items/bloc/item_bloc.dart';
import 'package:vaultapp/core/di/locator.dart';

import '../list/list_element.dart';

class UserItemScreen extends StatelessWidget {
  const UserItemScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ItemBloc itemBloc = locator<ItemBloc>();

    return BlocListener<ItemBloc, ItemState>(
        listener: ((context, state) {
          print(state);
          if (state is! GetAllUserItemsSuccessState) {
            //itemBloc.add(GetAllUserItemsEvent());
          }
        }),
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Objets possédés"),
          ),
          body: BlocBuilder<ItemBloc, ItemState>(
            builder: (context, state) {
             print(state);
              if (state is GetAllUserItemsSuccessState) {
                return ListView.builder(
                  itemCount: state.userItems.length,
                  itemBuilder: ((context, index) {
                  return ListElement(item: state.userItems[index].item);
                }));
              }

              if (state is ItemInitialState) {
                itemBloc.add(GetAllUserItemsEvent());
              }
              return Container();
            }
          ),
        ));
  }
}
