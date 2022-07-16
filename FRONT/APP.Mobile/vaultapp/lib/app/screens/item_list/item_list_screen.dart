import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vaultapp/app/app_routes.dart';
import 'package:vaultapp/app/modules/items/bloc/item_bloc.dart';
import 'package:vaultapp/app/screens/item_list/widgets/item_tile_widget.dart';
import 'package:vaultapp/core/di/locator.dart';

class ItemListScreen extends StatelessWidget {
  const ItemListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ItemBloc itemBloc = locator<ItemBloc>();
    itemBloc.add(GetAllItemsEvent());
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              child: const Icon(Icons.close),
              onTap: () {
                Navigator.pushReplacementNamed(context, homeScreen);
              },
            ),
          )
        ],
        title: const Text("Liste d'objets"),
      ),
      body: BlocBuilder<ItemBloc, ItemState>(
        builder: (context, state) {
          if (state is GetAllItemsSuccessState) {
            return ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: state.items.length,
                itemBuilder: (context, index) {
                  return ItemTile(item: state.items[index]);
                });
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacementNamed(context, createItemScreen);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
