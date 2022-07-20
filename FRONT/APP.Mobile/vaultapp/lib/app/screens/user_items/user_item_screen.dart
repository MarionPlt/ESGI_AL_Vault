// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vaultapp/app/app_routes.dart';
import 'package:vaultapp/app/modules/items/bloc/item_bloc.dart';
import 'package:vaultapp/core/di/locator.dart';
import 'user_item_element.dart';

class UserItemScreen extends StatelessWidget {
  const UserItemScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ItemBloc itemBloc = locator<ItemBloc>();
    itemBloc.add(GetAllUserItemsEvent());

    return Scaffold(
      appBar: AppBar(
        title: const Text("Objets possédés"),
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
      ),
      body: BlocBuilder<ItemBloc, ItemState>(builder: (context, state) {
        if (state is GetAllUserItemsSuccessState) {
          if (state.isOffline) {
            SchedulerBinding.instance.addPostFrameCallback((_) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(
                    "La connexion avec l'api a été perdue. Utilisation des données locales."),
                action: SnackBarAction(label: "Fermer", onPressed: () {}),
              ));
            });
          }
          return ListView.builder(
              itemCount: state.userItems.length,
              itemBuilder: ((context, index) {
                return ListElement(userItem: state.userItems[index]);
              }));
        } else if (state is GetAllUserItemsFailedState) {
          SchedulerBinding.instance.addPostFrameCallback((_) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("Une erreur s'est produite : ${state.message}"),
              action: SnackBarAction(label: "Fermer", onPressed: () {}),
            ));
          });
        } else if (state is ItemLoadingState) {
          return Center(child: CircularProgressIndicator());
        }
        return Padding(
            padding: EdgeInsets.all(10),
            child: Text(
                "Une erreur inattendue s'est produite. Veuillez réessayer ultérieurement."));
      }),
    );
  }
}
