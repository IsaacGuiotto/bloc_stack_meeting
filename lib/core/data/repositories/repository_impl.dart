import 'package:bloc_stack_meeting/core/data/data_sources/remote/remote_data_source.dart';
import 'package:bloc_stack_meeting/core/domain/repositories/repository.dart';

import '../../handlers/result/result.dart';

class RepositoryImpl extends Repository {
  final RemoteDataSource ds = RemoteDataSourceImpl();

  @override
  Future<Result<String, List<String>>> fetchHomeList() async {
    final Result<String, Map<String, dynamic>> result =
        await ds.fetchHomeList();

    if (result.hasError) {
      return Result(error: "Server Error");
    }

    if (result.data == null || result.data!.isEmpty) {
      return Result(error: "No Data available");
    }

    final List<String> homeList = [];

    for (final reason in result.data!["reasons"]) {
      homeList.add(reason);
    }

    return Result(data: homeList);
  }
}
