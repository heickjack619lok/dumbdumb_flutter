import 'package:dumbdumb_flutter_app/app/assets/exporter/importer_app_general.dart';
import 'package:dumbdumb_flutter_app/app/assets/exporter/importer_app_structural_component.dart';

/// A base class to unified all the required common fields and functions
class BaseServices {
  BaseServices() {
    _init();
  }

  static BaseServices? _instance;
  static String? hostUrl;
  static String? refreshTokenUrl = "/account/refresh"; //subject to change based on backend configuration
  String apiUrl() => hostUrl ?? '';

  /// private access dio instance and accessible using dio() getter
  Dio? _dio;

  /// eg: single dio instance will created and reuse by all services.
  /// remove the needs to create new Dio() instance in every services
  Dio? get dio {
    if (_instance == null || _instance?._dio == null) {
      _instance?._init();
    }
    return _instance?._dio;
  }

  /// Generate the token strings with Bearer Authentication format
  String get authToken {
    return 'Bearer ${SharedPreferenceHandler.getAccessToken()}';
  }

  /// Generate the token strings with Bearer Authentication format
  String get refreshToken {
    return 'Bearer ${SharedPreferenceHandler.getRefreshToken()}';
  }

  /// Function to include all required initialization steps
  /// 1. Create Dio() instance with Options
  /// 2. Added AuthenticationInterceptor to handle JWT Authentication Feature
  Future _init() async {
    _instance = this;
    _dio =
        Dio(BaseOptions(headers: <String, String>{'Content-Type': ContentType.json.value, 'Authorization': authToken}));

    _dio?.interceptors.add(QueuedInterceptorsWrapper(onError: (error, handler) async {
      /// Access Token is considered expired when API return code 401/403
      /// Subject to change depends on backend configuration
      if (error.response?.statusCode == HttpErrorCode.forbidden ||
          error.response?.statusCode == HttpErrorCode.unauthorized) {
        try {
          final dynamic responseRefreshToken = await _refreshTokenAPI();

          if (responseRefreshToken is bool) {
            final options = error.response!.requestOptions;
            options.headers['Authorization'] = authToken;

            await Dio().fetch<dynamic>(options).then((r) {
              return handler.resolve(r);
            });
          } else {
            return handler.reject(responseRefreshToken);
          }
        } catch (e) {
          if (e is DioException) {
            handler.reject(e);
          }
        }
      }
      return handler.reject(error);
    }));
  }

  Future<dynamic> _refreshTokenAPI() async {
    try {
      final response = await Dio().post<String>(
        '$hostUrl/$refreshTokenUrl',
        options: Options(headers: <String, String>{'Authorization': refreshToken}),
      );

      if (response.statusCode == HttpStatus.ok) {
        final tokenModel = TokenModel.fromJson(json.decode(response.data ?? '') as Map<String, dynamic>);
        SharedPreferenceHandler.putAccessToken(tokenModel.accessToken);
        SharedPreferenceHandler.putRefreshToken(tokenModel.refreshToken);
      }
      return response.statusCode == HttpStatus.ok;
    } catch (e) {
      if (e is DioException) {
        e.response?.data =
            ErrorModel(e.response?.statusCode ?? HttpErrorCode.none, errorMessage: e.response?.statusMessage);
      }
      return e;
    }
  }

  /// Standardized api calling with try-catch block
  /// Respond with MyResponse object for consistent data/error handling in services layer
  /// Accessible by all inheriting classes
  Future<MyResponse> callAPI(HttpRequestType requestType, String path,
      {Map<String, dynamic>? postBody, Options? options}) async {
    try {
      dio?.options.contentType = Headers.jsonContentType;
      dio?.options.headers.addEntries([MapEntry('Accept-Language', SharedPreferenceHandler.getLanguage())]);
      Response? response;

      switch (requestType) {
        case HttpRequestType.get:
          {
            response = await dio?.get(path);
          }
          break;
        case HttpRequestType.post:
          {
            response = await dio?.post(path, data: postBody);
          }
          break;
        case HttpRequestType.put:
          response = await dio?.put(path, data: postBody);
          break;
        case HttpRequestType.delete:
          response = await dio?.delete(path, data: postBody);
          break;
      }

      if (response?.statusCode == HttpStatus.ok) {
        return MyResponse.complete(response?.data as String);
      }
    } catch (e) {
      if (e is DioException && e.response?.data != null) {
        var processedError = ErrorModel.fromJson(e.response?.data);
        processedError.errorCode = e.response?.statusCode;
        return MyResponse.error(processedError.toJson());
      } else if (e is DioException && e.type == DioExceptionType.connectionTimeout) {
        return MyResponse.error(JsonParsing(ErrorModel(0, errorMessage: S.current.apiRequestFailed)).toJson());
      }
      return MyResponse.error(e);
    }
    return MyResponse.error(DioException(requestOptions: RequestOptions(path: path)));
  }
}
