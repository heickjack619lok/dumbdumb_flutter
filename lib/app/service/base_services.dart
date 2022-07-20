import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dumbdumb_flutter_app/app/assets/constants.dart';
import 'package:dumbdumb_flutter_app/app/model/error_model.dart';
import 'package:dumbdumb_flutter_app/app/utils/util.dart';

import '../model/network/my_response.dart';
import '../utils/shared_preference_handler.dart';
import '../model/token_model.dart';

/// A base class to unified all the required common fields and functions
class BaseServices {

  BaseServices() { _init(); }

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
    _dio = Dio(BaseOptions(headers: <String, String>{
      'Content-Type': ContentType.json.value,
      'Authorization': authToken
    }));

    _dio?.interceptors
        .add(QueuedInterceptorsWrapper(onError: (error, handler) async {
          /// Access Token is considered expired when API return code 401/403
          /// Subject to change depends on backend configuration
          if (error.response?.statusCode == 403 || error.response?.statusCode == 401) {
            try {
              final dynamic responseRefreshToken = await _refreshTokenAPI();

              if (responseRefreshToken is bool) {
                final options = error.response!.requestOptions;
                options.headers['Authorization'] = authToken;

            await Dio().fetch<dynamic>(options).then((r) {
              return handler.resolve(r);
            });
          }
          return handler.reject(responseRefreshToken);
        } catch (e) {
          if (e is DioError) {
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
        options: Options( headers: <String, String>{'Authorization': refreshToken}),
      );

      if (response.statusCode == HttpStatus.ok) {
        final tokenModel = TokenModel.fromJson(
            json.decode(response.data ?? '') as Map<String, dynamic>);
        SharedPreferenceHandler.putAccessToken(tokenModel.accessToken);
        SharedPreferenceHandler.putRefreshToken(tokenModel.refreshToken);
      }
      return response.statusCode == HttpStatus.ok;
    } catch (e) {
      if (e is DioError) {
        e.response?.data = ErrorModel(errorCode: e.response?.statusCode ?? HttpErrorCode.NONE, errorMessage: e.response?.statusMessage);
      }
      return e;
    }
  }

  /// Standardized api calling with try-catch block
  /// Respond with MyResponse object for consistent data/error handling in services layer
  /// Accessible by all inheriting classes
  Future<MyResponse> callAPI(HttpRequestType requestType, String path,
      { Map<String, dynamic>? postBody, Options? options}) async {
    try {
      dio?.options.contentType = Headers.formUrlEncodedContentType;
      var response;

      switch(requestType) {
        case HttpRequestType.GET: {
          response = await dio?.get(path);
        } break;
        case HttpRequestType.POST: {
          response = await dio?.post(path, data: postBody);
        } break;
        case HttpRequestType.PUT:
          response = await dio?.put(path, data: postBody);
          break;
        case HttpRequestType.DELETE:
          response = await dio?.delete(path, data: postBody);
          break;
      }

      if(response?.statusCode == HttpStatus.ok) {
        return MyResponse.complete(response?.data as String);
      }
    } catch(e) {
      if(e is DioError && e.response?.data != null) {
        return MyResponse.error(JsonParsing(e.response?.data).toJson());
      }
      return MyResponse.error(e);
    }
    return MyResponse.error(DioError(requestOptions: RequestOptions(path: path)));
  }
}
