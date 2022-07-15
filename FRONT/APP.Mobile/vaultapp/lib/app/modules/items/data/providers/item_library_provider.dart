import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:vaultapp/app/modules/items/data/models/book.dart';
import 'package:vaultapp/app/modules/items/data/models/item.dart';
import 'package:vaultapp/app/modules/items/data/models/movie.dart';
import 'package:vaultapp/app/modules/items/data/models/user_item.dart';
import 'package:vaultapp/app/modules/items/data/models/video_game.dart';

class ItemLibraryProvider {
  final libraryURL = 'https://localhost:7194';

  Future<Item> getItemById(String itemId) async {
    final result = await http.get(Uri.parse("$libraryURL/item/$itemId"));
    return Item.fromJson(jsonDecode(result.body));
  }

  Future<List<Item>> getAllItems() async {
    final result = await http.get(Uri.parse("$libraryURL/item"));

    final Iterable itemList = jsonDecode(result.body);

    return itemList.map((item) => Item.fromJson(item)).toList();
  }

  Future<Book> createBook(Book book) async {
    final response = await http.post(Uri.parse("$libraryURL/book"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: book.toJson());

    if (response.statusCode == 201) {
      return Book.fromJson(jsonDecode(response.body));
    } else {
      throw Exception(response.statusCode);
    }
  }

  Future<Movie> createMovie(Movie movie) async {
    final response = await http.post(Uri.parse("$libraryURL/movie"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: movie.toJson());

    if (response.statusCode == 201) {
      return Movie.fromJson(jsonDecode(response.body));
    } else {
      throw Exception(response.statusCode);
    }
  }

  Future<VideoGame> createVideoGame(VideoGame videoGame) async {
    final response = await http.post(Uri.parse("$libraryURL/videogame"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: videoGame.toJson());

    if (response.statusCode == 201) {
      return VideoGame.fromJson(jsonDecode(response.body));
    } else {
      throw Exception(response.statusCode);
    }
  }

  Future<UserItem> getUserItemById(String userItemId) async {
    final result =
        await http.get(Uri.parse("$libraryURL/useritem/$userItemId"));
    return UserItem.fromJson(jsonDecode(result.body));
  }

  Future<List<UserItem>> getAllUserItemsByUserId(String userId) async {
    final result =
        await http.get(Uri.parse("$libraryURL/useritem/user/$userId"));

    final Iterable userItemsList = jsonDecode(result.body);

    return userItemsList.map((userItem) => UserItem.fromJson(userItem)).toList();
  }

  Future<UserItem> createUserItem(UserItem userItem, String itemId, String userId) async {
    final response = await http.post(Uri.parse("$libraryURL/useritem/user/$userId/item/$itemId"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: userItem.toJson());

    if (response.statusCode == 201) {
      return UserItem.fromJson(jsonDecode(response.body));
    } else {
      throw Exception(response.statusCode);
    }
  }

  Future<UserItem> updateUseritem(UserItem userItem) async {
    final userItemId = userItem.id;
    final response = await http.put(Uri.parse("$libraryURL/useritem/$userItemId"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: userItem.toJson());

    if (response.statusCode == 201) {
      return UserItem.fromJson(jsonDecode(response.body));
    } else {
      throw Exception(response.statusCode);
    }
  }

  Future deleteUserItem(String userItemId) async {
    final response = await http.delete(Uri.parse("$libraryURL/useritem/$userItemId"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        });

    // TODO : implémenter le delete.
  }
}
