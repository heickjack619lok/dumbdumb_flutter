import 'package:dumbdumb_flutter_app/app/assets/constants.dart';

class ErrorModel {
  ErrorModel(this.errorCode,
      {this.errorMessage,
      this.errorCodeDescription,
      this.error,
      this.errorDescription});

  ErrorModel.fromJson(Map<String, dynamic> json) {
    errorCode = int.tryParse(json['errorCode'].toString()) ?? 0;
    errorMessage = json['errorMessage'] != null ? json['errorMessage'].toString() : '';
    errorCodeDescription = json['errorCodeDescription'] != null ? json['errorCodeDescription'].toString() : '';
    error = json['error'] != null ? json['error'].toString() : '';
    errorDescription = json['error_description'] != null ? json['error_description'].toString() : '';
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

  int? errorCode;

  /// error from api response failure
  String? errorMessage;
  String? errorCodeDescription;

  /// error from server common failure
  String? error;
  String? errorDescription;

  bool forbidden() => errorCode == HttpErrorCode.UNAUTHORIZED || errorCode == HttpErrorCode.FORBIDDEN;
}
