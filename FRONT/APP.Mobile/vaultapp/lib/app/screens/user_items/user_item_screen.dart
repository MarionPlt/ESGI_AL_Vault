import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vaultapp/app/modules/items/bloc/item_bloc.dart';
import 'package:vaultapp/core/di/locator.dart';

class UserItemScreen extends StatelessWidget {
  const UserItemScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ItemBloc itemBloc = locator<ItemBloc>();

    return BlocListener<ItemBloc, ItemState>(
        listener: ((context, state) {
          if (state is! GetAllUserItemsSuccessState) {
            itemBloc.add(GetAllUserItemsEvent());
          }
        }),
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Objets possédés"),
          ),
          body: BlocBuilder<ItemBloc, ItemState>(
            builder: (context, state) {
              if (state is GetAllUserItemsSuccessState) {
                return ListView.builder(itemBuilder: ((context, index) {
                  return Text(state.userItems[index].id!);
                }));
              }
              return Container();
            }
          ),
        ));
  }
}
