import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WidgetUtil {
  static void showAlertDialog(BuildContext context, String? title,
      String? content, List<Widget> actions, bool dismissible) {
    showDialog<void>(
        context: context,
        barrierDismissible: dismissible,
        builder: (BuildContext context) => Platform.isAndroid
            ? getMaterialDialog(title, content, actions)
            : getCupertinoDialog(title, content, actions));
  }

  static Widget getCupertinoDialog(
      String? title, String? content, List<Widget> actions) {
    return CupertinoAlertDialog(
      title: Text(title ?? ''),
      content: Text(content ?? ''),
      actions: actions,
    );
  }

  static Widget getMaterialDialog(
      String? title, String? content, List<Widget> actions) {
    return AlertDialog(
      title: Text(title ?? ''),
      content: Text(content ?? ''),
      actions: actions,
    );
  }

  static Widget getDialogButton(String text, VoidCallback? onPressed) {
    return Platform.isAndroid
        ? TextButton(onPressed: onPressed, child: Text(text))
        : CupertinoDialogAction(
      onPressed: onPressed,
      child: Text(text),
    );
  }

  static double getScaleFactor(BuildContext context) =>
      min(MediaQuery.of(context).textScaleFactor, 1.3);
}

extension DynamicParsing on dynamic {
  String parseString() => this != null ? toString() : '';

  int parseInt() => this != null ? (int.tryParse(toString()) ?? 0) : 0;

  double parseDouble() =>
      this != null ? (double.tryParse(toString()) ?? 0.0) : 0.0;

  bool parseBool() {
    if (this != null) {
      return this as bool;
    } else {
      return false;
    }
  }
}

extension JsonParsing on dynamic {
  String toJson() => jsonEncode(this);
  Map<String, dynamic> fromJson() => jsonDecode(this) as Map<String, dynamic>;
}
