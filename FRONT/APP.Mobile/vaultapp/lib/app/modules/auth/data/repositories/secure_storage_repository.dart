import 'package:vaultapp/app/modules/auth/data/providers/local_storage_auth_provider.dart';

class SecureStorageRepository {
  final LocalStorageAuthProvider _localStorageAuthProvider =
      LocalStorageAuthProvider();

  Future saveUserId(String userId) async {
    await _localStorageAuthProvider.storeUserId(userId);
  }

  Future<String?> getUserId() async {
    print("get user id");
    return await _localStorageAuthProvider.retrieveUserId();
  }

  Future removeUserId() async {
    return await _localStorageAuthProvider.removeUserId();
  }
}
