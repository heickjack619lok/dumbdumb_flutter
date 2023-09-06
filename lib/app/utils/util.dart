import 'package:dumbdumb_flutter_app/app/assets/exporter/importer_app_general.dart';

class WidgetUtil {
  static void showAlertDialog(
      BuildContext context, String? title, String? content, List<Widget> actions, bool dismissible) {
    showDialog<void>(
        context: context,
        barrierDismissible: dismissible,
        builder: (BuildContext context) => Platform.isAndroid
            ? getMaterialDialog(title, content, actions)
            : getCupertinoDialog(title, content, actions));
  }

  static Widget getCupertinoDialog(String? title, String? content, List<Widget> actions) {
    return CupertinoAlertDialog(title: Text(title ?? ''), content: Text(content ?? ''), actions: actions);
  }

  static Widget getMaterialDialog(String? title, String? content, List<Widget> actions) {
    return AlertDialog(title: Text(title ?? ''), content: Text(content ?? ''), actions: actions);
  }

  static Widget getDialogButton(String text, VoidCallback? onPressed) {
    return Platform.isAndroid
        ? TextButton(onPressed: onPressed, child: Text(text))
        : CupertinoDialogAction(onPressed: onPressed, child: Text(text));
  }

  static void showSnackBar(BuildContext context, String text) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(text)))
        .closed
        .then((_) => ScaffoldMessenger.of(context).clearSnackBars());
  }

  static double getScaleFactor(BuildContext context) => min(MediaQuery.of(context).textScaleFactor, 1.3);
}

extension WidgetExtension on EdgeInsets {
  EdgeInsets tabletMode(FlutterView flutterView, {bool includeExistingValue = false}) {
    if (SharedPreferenceHandler.getIsTablet()) {
      var tabletPaddingPercentage = 0.05;
      var screenSize = flutterView.physicalSize;
      double width = screenSize.width;
      var leftRightPadding = width * tabletPaddingPercentage;

      var newLeft = includeExistingValue ? left + leftRightPadding : leftRightPadding;
      var newRight = includeExistingValue ? right + leftRightPadding : leftRightPadding;
      return copyWith(left: newLeft, right: newRight);
    }
    return this;
  }
}

extension FontSizeExtension on TextStyle {
  TextStyle tabletFont(FlutterView flutterView) {
    var screenSize = flutterView.physicalSize;
    var ratio = flutterView.devicePixelRatio;
    var logicalPixel = screenSize / ratio;

    double unitHeightValue = logicalPixel.height * 0.01;
    double multiplier = 1.5;

    if (SharedPreferenceHandler.getIsTablet()) {
      return copyWith(fontSize: multiplier * unitHeightValue);
    }
    return this;
  }
}

extension DynamicParsing on dynamic {
  String parseString() => this != null ? toString() : '';

  int parseInt() => this != null ? (int.tryParse(toString()) ?? 0) : 0;

  double parseDouble() => this != null ? (double.tryParse(toString()) ?? 0.0) : 0.0;

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
