import 'package:firebase_auth/firebase_auth.dart';

import '../../handlers/result/result.dart';

abstract class FirebaseAuthentication {
  Future<Result<String, void>> login(String email, String pass);
  void logOut();
}

class FirebaseAuthenticationImpl extends FirebaseAuthentication {
  final _auth = FirebaseAuth.instance;

  @override
  Future<Result<String, void>> login(String email, String pass) async {
    try {
      final result =
          await _auth.signInWithEmailAndPassword(email: email, password: pass);
      return Result();
    } catch (e) {
      return Result(error: e.toString());
    }
  }

  @override
  void logOut() {
    _auth.signOut();
  }
}
