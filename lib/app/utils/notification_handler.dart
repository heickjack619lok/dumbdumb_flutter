import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../assets/exporter/importer_app_general.dart';

typedef NotificationClickedCallback = void Function(String payload);
typedef NotificationPageRedirectCallback = void Function(String shouldRedirect);
typedef NotificationReceivedCallback = void Function();

/// Notification from background will display on system tray by default.
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
}

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

/// Create a [AndroidNotificationChannel] for heads up notifications
const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'my_dumbdumb_channel', // id
    'my app important channel', // title
    description: 'This channel is used for my app important notifications.', // description
    importance: Importance.high,
    showBadge: true);

NotificationHandler? instance;

class NotificationHandler {
  static Future<NotificationHandler?> getInstance() async {
    if (instance == null) {
      instance = NotificationHandler();
      await instance?.init();
    }
    return instance;
  }

  Future<void> init() async {
    await Firebase.initializeApp();

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    const initializationSettingsAndroid = AndroidInitializationSettings('mipmap/ic_launcher');
    const initializationSettingsIOS = DarwinInitializationSettings();
    const initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid, iOS: initializationSettingsIOS);

    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse: selectNotification);

    /// Update the iOS foreground notification presentation options to allow
    /// heads up notifications.
    await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(alert: true, badge: true);

    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      debugPrint('firebase onMessage: ${message.notification?.title}');
      showNotification(message, flutterLocalNotificationsPlugin);
    });

    final token = await FirebaseMessaging.instance.getToken();

    updateTokenToServer(token);
  }

  static Future<void> showNotification(
      RemoteMessage message, FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) async {
    var notificationDetail = Platform.isAndroid
        ? NotificationDetails(
            android: AndroidNotificationDetails(channel.id, channel.name,
                channelDescription: channel.description, icon: 'mipmap/ic_launcher', channelShowBadge: true))
        : const NotificationDetails(iOS: DarwinNotificationDetails(presentAlert: true, presentBadge: true));

    try {
      flutterLocalNotificationsPlugin.show(message.hashCode, message.notification?.title ?? "My Dumb Dumb App",
          message.notification?.body ?? "-", notificationDetail);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future selectNotification(NotificationResponse notificationResponse) async {}

  void updateTokenToServer(String? token) {}
}
