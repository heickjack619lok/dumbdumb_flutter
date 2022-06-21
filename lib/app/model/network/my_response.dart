class MyResponse<T, V> {
  ResponseStatus _status;
  T? _data;
  V? _error;

  MyResponse.initial() : _status = ResponseStatus.INITIAL;
  MyResponse.loading(): _status = ResponseStatus.LOADING;
  MyResponse.complete(data) : _status = ResponseStatus.COMPLETE, _data = data;
  MyResponse.error(error) : _status = ResponseStatus.ERROR, _error = error;

  V? get error => _error;
  T? get data => _data;
  ResponseStatus get status => _status;
}

enum ResponseStatus { INITIAL, COMPLETE, ERROR, LOADING, CONSUMED }
