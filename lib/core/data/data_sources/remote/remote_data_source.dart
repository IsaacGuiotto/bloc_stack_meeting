import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../handlers/result/result.dart';

abstract class RemoteDataSource {
  Future<Result<String, Map<String, dynamic>>> fetchHomeList();
}

class RemoteDataSourceImpl extends RemoteDataSource {
  @override
  Future<Result<String, Map<String, dynamic>>> fetchHomeList() async {
    var url = Uri.parse('https://academy-auth.herokuapp.com/xcode-poggers');
    final http.Response result = await http.get(url);
    return Result(data: json.decode(result.body));
  }
}
