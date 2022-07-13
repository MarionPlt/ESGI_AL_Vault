import 'package:vaultapp/app/modules/auth/data/providers/identity_auth_provider.dart';

class AuthRepository {
  final IdentityAuthProvider _identityAuthProvider = IdentityAuthProvider();

  Future<String> login(String username, String password) async {
    return await _identityAuthProvider.login(username, password);
  }

  Future<String> register(String username, String password) async {
    return await _identityAuthProvider.register(username, password);
  }
}
