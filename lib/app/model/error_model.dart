import 'package:dumbdumb_flutter_app/app/assets/exporter/importer_app_general.dart';

class ErrorModel {
  int? errorCode;

  /// error from api response failure
  String? errorMessage;
  String? errorCodeDescription;

  /// error from server common failure
  String? error;
  String? errorDescription;

  ErrorModel(this.errorCode, {this.errorMessage, this.errorCodeDescription, this.error, this.errorDescription});

  ErrorModel.fromJson(Map<String, dynamic> json) {
    errorCode = int.tryParse(json['errorCode'].toString()) ?? 0;
    errorMessage = DynamicParsing(json['errorMessage']).parseString();
    errorCodeDescription = DynamicParsing(json['errorCodeDescription']).parseString();
    error = DynamicParsing(json['error']).parseString();
    errorDescription = DynamicParsing(json['error_description']).parseString();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['errorCode'] = errorCode;
    data['errorMessage'] = errorMessage;
    data['errorCodeDescription'] = errorCodeDescription;
    data['error'] = error;
    data['error_description'] = errorDescription;
    return data;
  }

  String? getErrorMessageTitle() {
    if (errorCodeDescription?.isNotEmpty == true) {
      return errorCodeDescription;
    } else if (error?.isNotEmpty == true) {
      return error;
    }
    return null;
  }

  String? getErrorMessage() {
    if (errorMessage?.isNotEmpty == true) {
      return errorMessage;
    } else if (errorDescription?.isNotEmpty == true) {
      return errorDescription;
    }
    return null;
  }

  bool forbidden() => errorCode == HttpErrorCode.unauthorized || errorCode == HttpErrorCode.forbidden;
}
