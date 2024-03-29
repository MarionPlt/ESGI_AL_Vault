import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:vaultapp/app/modules/items/data/models/book.dart';
import 'package:vaultapp/app/modules/items/data/models/item.dart';
import 'package:vaultapp/app/modules/items/data/models/movie.dart';
import 'package:vaultapp/app/modules/items/data/models/user_item.dart';
import 'package:vaultapp/app/modules/items/data/models/video_game.dart';

class ItemLibraryProvider {
  final libraryURL =
      'http://ec2-15-237-126-251.eu-west-3.compute.amazonaws.com:5001';

  Future<Item> getItemById(String itemId) async {
    final result = await http.get(Uri.parse("$libraryURL/item/$itemId"));
    final item = Item.fromJson(jsonDecode(result.body));
    if (item.type == "Movie") {
      return Movie.fromJson(jsonDecode(result.body));
    } else if (item.type == "Book") {
      return Book.fromJson(jsonDecode(result.body));
    } else if (item.type == "VideoGame") {
      return VideoGame.fromJson(jsonDecode(result.body));
    }
    return item;
  }

  Future<List<Item>> getAllItems(
      String? typeFilter, String? labelFilter) async {
    String baseUrl = "$libraryURL/item?";

    if (typeFilter != null) {
      baseUrl = "${baseUrl}type=$typeFilter&";
    }
    if (labelFilter != null) {
      baseUrl = "${baseUrl}label=$labelFilter&";
    }

    final result = await http.get(Uri.parse(baseUrl));

    final Iterable itemList = jsonDecode(result.body);

    return itemList.map((item) => Item.fromJson(item)).toList();
  }

  Future<Book> createBook(Book book) async {
    final response = await http.post(Uri.parse("$libraryURL/book"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(book.toJson()));

    if (response.statusCode == 200) {
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
    final result = await http
        .get(Uri.parse("$libraryURL/useritem/$userItemId"))
        .timeout(const Duration(seconds: 8), onTimeout: () {
      throw const SocketException("Erreur lors de la connexion à l'API");
    });
    return UserItem.fromJson(jsonDecode(result.body));
  }

  Future<List<UserItem>> getAllUserItemsByUserId(String userId) async {
    final result = await http
        .get(Uri.parse("$libraryURL/useritem/user/$userId"))
        .timeout(const Duration(seconds: 8), onTimeout: () {
      throw const SocketException("Erreur lors de la connexion à l'API");
    });

    final Iterable userItemsList = jsonDecode(result.body);

    return userItemsList
        .map((userItem) => UserItem.fromJson(userItem))
        .toList();
  }

  Future<UserItem> createUserItem(
      UserItem userItem, String itemId, String userId) async {
    final response = await http.post(
        Uri.parse("$libraryURL/useritem/user/$userId/item/$itemId"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(userItem.toJson()));
    if (response.statusCode == 201) {
      return UserItem.fromJson(jsonDecode(response.body));
    } else {
      throw Exception(response.statusCode);
    }
  }

  Future<UserItem> updateUseritem(UserItem userItem) async {
    final response =
        await http.put(Uri.parse("$libraryURL/useritem/${userItem.id}"),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: jsonEncode(userItem.toJson()));
    if (response.statusCode == 200) {
      return UserItem.fromJson(jsonDecode(response.body));
    } else {
      throw Exception(response.statusCode);
    }
  }

  Future deleteUserItem(String userItemId) async {
    final response = await http.delete(
        Uri.parse("$libraryURL/useritem/$userItemId"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        });

    // TODO : implémenter le delete.
  }
}
