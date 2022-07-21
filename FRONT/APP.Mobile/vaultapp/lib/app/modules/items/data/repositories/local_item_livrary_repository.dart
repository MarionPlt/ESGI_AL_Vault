import 'package:vaultapp/app/modules/items/data/models/user_item.dart';
import 'package:vaultapp/app/modules/items/data/providers/local_item_library_provider.dart';

class LocalItemLibraryRepository {
  final LocalItemLibraryProvider _provider = LocalItemLibraryProvider();

  Future<UserItem> getUserItem(String userItemId) async {
    return await _provider.getUserItem(userItemId);
  }

  Future<List<UserItem>> getAllUserItems() async {
    return await _provider.getAllUserItems();
  }

  Future addUserItem(UserItem userItem) async {
    await _provider.addUserItem(userItem);
  }

  Future addUserItems(List<UserItem> userItems) async {
    await _provider.addUserItems(userItems);
  }

  Future updateUserItem(UserItem userItem) async {
    await _provider.updateUserItem(userItem);
  }

  Future deleteAll() async {
    await _provider.deleteAll();
  }
}
