class MyResponse<T, V> {
  final ResponseStatus _status;
  T? _data;
  V? _error;

  MyResponse.initial() : _status = ResponseStatus.initial;
  MyResponse.loading(): _status = ResponseStatus.loading;
  MyResponse.complete(data) : _status = ResponseStatus.complete, _data = data;
  MyResponse.error(error) : _status = ResponseStatus.error, _error = error;

  V? get error => _error;
  T? get data => _data;
  ResponseStatus get status => _status;
}

enum ResponseStatus { initial, complete, error, loading, consumed }
