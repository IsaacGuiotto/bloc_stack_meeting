import 'package:bloc_stack_meeting/core/data/data_sources/remote/authentication_data_source.dart';
import 'package:bloc_stack_meeting/core/domain/repositories/authentication_repository.dart';
import 'package:bloc_stack_meeting/core/handlers/result/result.dart';

class AuthenticationRepositoryImpl extends AuthenticationRepository {
  final AuthenticationDataSource ds = AuthenticationDataSourceImpl();

  @override
  Future<Result<String, void>> login(String email, String pass) async {
    final Result<String, void> result = await ds.login(email, pass);

    if (result.hasError) {
      return Result(error: result.error);
    }
    return Result();
  }

  @override
  void logOut() {
    ds.logOut();
  }
}
