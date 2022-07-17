import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'package:vaultapp/app/app_routes.dart';
import 'package:vaultapp/app/modules/items/bloc/item_bloc.dart';
import 'package:vaultapp/app/modules/items/data/models/book.dart';
import 'package:vaultapp/app/modules/items/data/models/item.dart';
import 'package:vaultapp/app/modules/items/data/models/movie.dart';
import 'package:vaultapp/app/modules/items/data/models/video_game.dart';
import 'package:vaultapp/app/screens/add_user_item/add_user_item_screen.dart';
import 'package:vaultapp/app/screens/item_details/widgets/book_details_widget.dart';
import 'package:vaultapp/app/screens/item_details/widgets/movie_details.widget.dart';
import 'package:vaultapp/app/screens/item_details/widgets/video_game_details_widget.dart';
import 'package:vaultapp/core/di/locator.dart';

class ItemDetailsScreen extends StatelessWidget {
  const ItemDetailsScreen({Key? key, required this.itemId}) : super(key: key);

  final String itemId;

  @override
  Widget build(BuildContext context) {
    final ItemBloc itemBloc = locator<ItemBloc>();
    itemBloc.add(GetItemEvent(itemId));

    return BlocBuilder<ItemBloc, ItemState>(
      builder: ((context, state) {
        if (state is GetItemSuccessState) {
          return Scaffold(
            appBar: AppBar(
                actions: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      child: Icon(Icons.close),
                      onTap: () {
                        Navigator.pushReplacementNamed(context, itemListScreen);
                      },
                    ),
                  )
                ],
                title: Text(
                  state.item.label,
                  style: TextStyle(fontSize: 20),
                ),
                automaticallyImplyLeading: true),
            body: Center(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Builder(builder: (context) {
                      if (state.item.imageURL != null &&
                          state.item.imageURL != "") {
                        return SizedBox(
                            height: 30.h,
                            width: 30.h,
                            child: Image.network(state.item.imageURL!,
                                errorBuilder: (context, url, error) {
                              return const Icon(Icons.image_not_supported);
                            }));
                      }
                      return SizedBox(
                          height: 30.h,
                          width: 30.h,
                          child: const Icon(Icons.image_not_supported));
                    }),
                    Text(
                        "Date de sortie : ${DateFormat.yMd().format(state.item.releaseDate)}",
                        style: const TextStyle(fontSize: 20)),
                    Text("Support : ${state.item.support}",
                        style: const TextStyle(fontSize: 20)),
                    Builder(builder: (context) {
                      if (state.item.type == "VideoGame") {
                        return VideoGameDetails(
                            videoGame: state.item as VideoGame);
                      }
                      if (state.item.type == "Book") {
                        return BookDetails(book: state.item as Book);
                      }
                      if (state.item.type == "Movie") {
                        return MovieDetails(movie: state.item as Movie);
                      }
                      return Container();
                    })
                  ]),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          AddUserItemScreen(item: state.item)),
                );
              },
              child: const Icon(Icons.add),
            ),
          );
        } else {
          return Container();
        }
      }),
    );
  }
}
