import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:vaultapp/app/modules/items/data/models/item.dart';

class ItemLibraryProvider {
  final libraryURL = 'http://localhost:5194'; 

  Future<Item> getItemById(String itemId) async {
    final result = await http.get(Uri.parse(libraryURL));
    return Item.fromJson(jsonDecode(result.body));
  }
}