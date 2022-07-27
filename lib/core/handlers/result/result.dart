class Result<String, T> {
  final String? error;
  final T? data;
  Result({this.error, this.data});

  bool get hasError => error != null;
}
