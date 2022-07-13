import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LocalStorageAuthProvider {
  final userIdKey = "userId";

  final storage = const FlutterSecureStorage();

  Future storeUserId(String userId) async {
    await storage.write(key: userIdKey, value: userId);
  }

  Future<String?> retrieveUserId() async {
    return await storage.read(key: userIdKey);
  }

  Future removeUserId() async {
    await storage.delete(key: userIdKey);
  }
}
