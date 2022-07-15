import 'package:vaultapp/app/modules/items/data/models/item.dart';
import 'package:vaultapp/app/modules/items/data/providers/item_library_provider.dart';

class ItemLibraryRepository {
  final ItemLibraryProvider _itemLibraryProvider = ItemLibraryProvider();

  Future<Item> getItemById(String itemId) async {
    return await _itemLibraryProvider.getItemById(itemId);
  }
}