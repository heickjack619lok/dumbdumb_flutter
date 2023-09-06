import 'package:dumbdumb_flutter_app/app/assets/exporter/importer_app_structural_component.dart';
import '../assets/exporter/importer_app_general.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter_jailbreak_detection/flutter_jailbreak_detection.dart';

/// Function to perform all initial configuration based on running environment
/// Any method, feature that requires to init()/start() before app running, may do it here
Future<void> init(EnvironmentType type) async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferenceHandler.getSharedPreference();

  // Setup hostURL for API call in services
  switch (type) {
    case EnvironmentType.production:
      {
        BaseServices.hostUrl = ProductionConstant.apiEndpoint;
      }
      break;
    case EnvironmentType.staging:
      {
        BaseServices.hostUrl = StagingConstant.apiEndpoint;
      }
      break;
    case EnvironmentType.development:
      {
        BaseServices.hostUrl = DevelopmentConstant.apiEndpoint;
      }
      break;
  }

  // Initialize Firebase Configurations
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform(type));

  // Pass all uncaught errors from the framework to Crashlytics.
  if (!kDebugMode) FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(!kDebugMode);
  FirebaseAnalytics.instance.setAnalyticsCollectionEnabled(!kDebugMode);

  if (SharedPreferenceHandler.getLanguage().isEmpty) {
    var systemLanguage = Platform.localeName;
    var appLanguage = Language.english;

    if (systemLanguage.contains(Language.english)) {
      appLanguage = Language.english;
    } else if (systemLanguage.contains(Language.bm)) {
      appLanguage = Language.bm;
    }

    SharedPreferenceHandler.putLanguage(appLanguage);
  }

  // App root detection
  // Platform messages may fail, so we use a try/catch PlatformException.
  bool jailBroken = false;
  bool developerMode = false;
  try {
    jailBroken = await FlutterJailbreakDetection.jailbroken;
    developerMode = await FlutterJailbreakDetection.developerMode;
  } catch (_) {
    jailBroken = true;
    developerMode = true;
  }

  SharedPreferenceHandler.putRootDetectionDeveloperMode(developerMode);
  SharedPreferenceHandler.putRootDetectionJailBroken(jailBroken);
}
