import 'package:bloc_stack_meeting/core/handlers/result/result.dart';

abstract class AuthenticationRepository {
  Future<Result<String, void>> login(String email, String pass);
  void logOut();
}
