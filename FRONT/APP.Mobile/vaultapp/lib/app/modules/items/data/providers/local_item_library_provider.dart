import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:vaultapp/app/modules/items/data/models/book.dart';
import 'package:vaultapp/app/modules/items/data/models/item.dart';
import 'package:vaultapp/app/modules/items/data/models/movie.dart';
import 'package:vaultapp/app/modules/items/data/models/user_item.dart';
import 'package:vaultapp/app/modules/items/data/models/video_game.dart';

class LocalItemLibraryProvider {
  Database? db;

  final userItemTable = "UserItems";
  final itemTable = "Items";

  Future initialiseDatabase() async {
    var _databasePath = await getDatabasesPath();

    db = await openDatabase(join(_databasePath, 'vault.db'), version: 1,
        onCreate: (Database db, int version) async {
      await db.execute('''
        CREATE TABLE $itemTable (
          id TEXT PRIMARY KEY,
          label TEXT NOT NULL,
          type TEXT NOT NULL,
          releaseDate TEXT NOT NULL,
          support TEXT,
          imageURL TEXT,
          
          director TEXT,
          
          editor TEXT,
          authors TEXT,
          
          volume INTEGER, 
          
          platform TEXT
        );
      ''');

      await db.execute('''
        CREATE TABLE $userItemTable (
          id text PRIMARY KEY,
          itemId text NOT NULL,
          state text NOT NULL,
          acquisitionDate text NOT NULL,
          collection text,
          FOREIGN KEY (itemid) REFERENCES $itemTable(id) 
        );
      ''');
    });
  }

  Future<UserItem> getUserItem(String userItemId) async {
    await initialiseDatabase();
    var result = await db!
        .query(userItemTable, where: 'id = ?', whereArgs: [userItemId]);
    return UserItem.fromJson(result.first);
  }

  Future<List<UserItem>> getAllUserItems() async {
    await initialiseDatabase();
    var result = await db!.rawQuery(
        'SELECT ui.*, i.* FROM UserItems ui INNER JOIN Items i on ui.itemId = i.id;');
    return result.map((e) => UserItem.fromFlatJson(e)).toList();
  }

  Future addUserItem(UserItem userItem) async {
    await initialiseDatabase();
    await insertUserItem(userItem);
  }

  Future addUserItems(List<UserItem> userItems) async {
    await initialiseDatabase();
    for (final userItem in userItems) {
      await insertUserItem(userItem);
    }
  }

  Future insertUserItem(UserItem userItem) async {
    if (userItem.item.type == "Book") {
      await db!.insert(itemTable, (userItem.item as Book).toJson());
    } else if (userItem.item.type == "Movie") {
      await db!.insert(itemTable, (userItem.item as Movie).toJson());
    } else if (userItem.item.type == "VideoGame") {
      await db!.insert(itemTable, (userItem.item as VideoGame).toJson());
    }
    await db!.insert(userItemTable, userItem.toJson());
  }

  Future deleteAll() async {
    await initialiseDatabase();
    await db!.delete(userItemTable);
    await db!.delete(itemTable);
  }
}
