import 'package:bloc_stack_meeting/core/wrappers/firebase/firebase_authentication.dart';

import '../../../handlers/result/result.dart';

abstract class AuthenticationDataSource {
  Future<Result<String, void>> login(String email, String pass);
  void logOut();
}

class AuthenticationDataSourceImpl extends AuthenticationDataSource {
  final FirebaseAuthentication db = FirebaseAuthenticationImpl();

  @override
  Future<Result<String, void>> login(String email, String pass) async {
    final Result<String, void> result = await db.login(email, pass);

    if (result.hasError) {
      return Result(error: result.error);
    }
    return Result();
  }

  @override
  void logOut() {
    db.logOut();
  }
}
