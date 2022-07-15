import 'package:vaultapp/app/modules/items/data/models/item.dart';

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
    Item? item = Item.fromJson(json['imageURL']);

    DateTime acquisitionDate = DateTime.fromMillisecondsSinceEpoch(json['acquisitionDate']);
    return UserItem(
        id: id,
        acquisitionDate: acquisitionDate,
        state: state,
        collection: collection,
        item: item);
  }

  Map<String, dynamic> toJson(String userId) {
    return {
      'id': id,
      'acquisitionDate': acquisitionDate.toIso8601String(),
      'state': state,
      'collection': collection
    };
  }
}