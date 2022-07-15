import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:vaultapp/app/modules/items/data/models/book.dart';
import 'package:vaultapp/app/modules/items/data/models/item.dart';

class ItemLibraryProvider {
  final libraryURL = 'http://localhost:5194'; 

  Future<Item> getItemById(String itemId) async {
    final result = await http.get(Uri.parse("$libraryURL/item/$itemId"));
    return Item.fromJson(jsonDecode(result.body));
  }

  Future<Book> createBook(Book book) async {
    final response = await http.post(Uri.parse("$libraryURL/item/book"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: book.toJson());

    if (response.)
  }
}