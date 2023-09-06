import 'package:dumbdumb_flutter_app/app/assets/exporter/importer_app_general.dart';

enum HttpRequestType { get, post, put, delete }

class HttpErrorCode {
  static const int unauthorized = 401;
  static const int forbidden = 403;
  static const int none = 0;
}

class Language {
  static const String english = "en";
  static const String bm = "ms";

  List<String> getLanguageList() {
    return <String>[english, bm];
  }

  String getLanguageDisplay(String lang) {
    switch (lang) {
      case english:
        return S.current.english;
      case bm:
        return S.current.bm;
      default:
        return S.current.english;
    }
  }
}
