import 'package:vaultapp/app/modules/items/data/models/book.dart';
import 'package:vaultapp/app/modules/items/data/models/item.dart';
import 'package:vaultapp/app/modules/items/data/models/movie.dart';
import 'package:vaultapp/app/modules/items/data/models/user_item.dart';
import 'package:vaultapp/app/modules/items/data/models/video_game.dart';
import 'package:vaultapp/app/modules/items/data/providers/item_library_provider.dart';

class ItemLibraryRepository {
  final ItemLibraryProvider _itemLibraryProvider = ItemLibraryProvider();

  Future<Item> getItemById(String itemId) async {
    return await _itemLibraryProvider.getItemById(itemId);
  }

  Future<List<Item>> getAllItems() async {
    return await _itemLibraryProvider.getAllItems();
  }

  Future<Book> createBook(Book book) async {
    return await _itemLibraryProvider.createBook(book);
  }
  Future<Movie> createMovie(Movie movie) async {
    return await _itemLibraryProvider.createMovie(movie);
  }
  Future<VideoGame> createVideoGame(VideoGame videoGame) async {
    return await _itemLibraryProvider.createVideoGame(videoGame);
  }

  Future<UserItem> getUserItemById(String userItemId) async {
    return await _itemLibraryProvider.getUserItemById(userItemId);
  }

  Future<List<UserItem>> getAllUserItems(String userId) async {
    return await _itemLibraryProvider.getAllUserItemsByUserId(userId);
  }

  Future<UserItem> createUserItem(UserItem userItem, String itemId, String userId) async {
    return await _itemLibraryProvider.createUserItem(userItem, itemId, userId);
  }

  Future<UserItem> updateUserItem(UserItem userItem) async {
    return await _itemLibraryProvider.updateUseritem(userItem);
  }
}