import '../../handlers/result/result.dart';

abstract class Repository {
  Future<Result<String, List<String>>> fetchHomeList();
}
