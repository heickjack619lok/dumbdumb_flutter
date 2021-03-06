
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dumbdumb_flutter_app/app/assets/constants.dart';
import 'package:dumbdumb_flutter_app/app/model/error_model.dart';
import 'package:dumbdumb_flutter_app/app/model/network/my_response.dart';

/// A base class to unified all the required common fields and functions
/// Inherited with ChangeNotifier for Provider State Management
/// All inheriting classes will be able to access these values and features
class BaseViewModel with ChangeNotifier {

  /// response that view layer listening for data changes
  /// view layer may perform data update or any Ui logic depends on response status
  MyResponse response = MyResponse.initial();

  /// An observable value to notify view layer for any error that required immediate attention
  /// Usage in this project will be:
  /// when JWT Authentication failure, immediately notify the view layer
  ErrorModel urgentError = ErrorModel(HttpErrorCode.NONE);

  /// Unified method to call Provider [notifyListeners()] to update [response] value.
  void notify(MyResponse newResponse) {
    _resetUrgent();
    _checkUrgentError(newResponse);
    response = newResponse;
    notifyListeners();
  }

  /// Unified method to call Provider [notifyListeners()] to update [urgentError] value.
  void _notifyUrgent(ErrorModel errorModel) {
    urgentError = errorModel;
    notifyListeners();
  }

  /// Reset [urgentError] to prevent duplicate notify.
  void _resetUrgent() {
    urgentError = ErrorModel(HttpErrorCode.NONE);
  }

  /// Handle response and [_notifyUrgent()] if user access status is FORBIDDEN/UNAUTHORIZED
  /// Subject to change based on server configuration
  void _checkUrgentError(MyResponse response) {
    if(response.status == ResponseStatus.ERROR && response.error != null && response.error is String) {
      ErrorModel error = ErrorModel.fromJson(jsonDecode(response.error as String));
      if(error.errorCode == HttpErrorCode.FORBIDDEN || error.errorCode == HttpErrorCode.UNAUTHORIZED) {
        _notifyUrgent(error);
      }
    }
  }
}