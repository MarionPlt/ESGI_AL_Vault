import 'package:vaultapp/app/modules/items/data/models/book.dart';
import 'package:vaultapp/app/modules/items/data/models/item.dart';
import 'package:vaultapp/app/modules/items/data/models/movie.dart';
import 'package:vaultapp/app/modules/items/data/models/video_game.dart';

class UserItem {
  UserItem({this.id, required this.acquisitionDate, required this.state, this.collection, this.item, this.itemId});
  
  String? id;
  DateTime acquisitionDate;
  String state;
  String? collection;
  Item? item;
  String? itemId;

  factory UserItem.fromJson(Map<String, dynamic> json) {
    String? id = json['id'];
    String state = json['state'];
    String? collection = json['collection'];
    Item? item = Item.fromJson(json['item']);
    
    if (item.type == 'Book') {
      item = Book.fromJson(json['item']);
    } else if (item.type == 'Movie') {
      item = Movie.fromJson(json['item']);
    } else if (item.type == 'VideoGame') {
      item = VideoGame.fromJson(json['item']);
    }

    DateTime acquisitionDate = DateTime.fromMillisecondsSinceEpoch(json['acquisitionDate']);
    return UserItem(
        id: id,
        acquisitionDate: acquisitionDate,
        state: state,
        collection: collection,
        item: item);
  }

  Map<String, dynamic> toJson() {
    return {
      'acquisitionDate': acquisitionDate.toIso8601String(),
      'state': state,
      'collection': collection
    };
  }
}