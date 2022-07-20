import 'package:dumbdumb_flutter_app/app/assets/constants.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'error_model.freezed.dart';
part 'error_model.g.dart';

@freezed
class ErrorModel with _$ErrorModel {
  factory ErrorModel({
    int? errorCode,

    /// error from api response failure
    String? errorMessage,
    String? errorCodeDescription,

    /// error from server common failure
    String? error,
    String? errorDescription,
  }) = _ErrorModel;

  factory ErrorModel.fromJson(Map<String, dynamic> json) =>
      _$ErrorModelFromJson(json);

  /// A private constructor is needed to add getters
  ErrorModel._();

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

  bool forbidden() =>
      errorCode == HttpErrorCode.UNAUTHORIZED ||
      errorCode == HttpErrorCode.FORBIDDEN;
}
