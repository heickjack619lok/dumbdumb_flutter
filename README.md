# DumbDumb Flutter App

[![License: MIT][license_badge]][license_link]

This is a starter project which consist of basic components that are commonly used across all project, eg: multiple flavoring/environment, Firebase Integration, API call, localization and more. This project is adapting MVVM (Model-View-ViewModel) as the principle architecture, as well as using Provider for state management.

---

## Getting Started 🚀

1. This project contains 3 flavors:

- development
- staging
- production

2. To run the desired flavor either use the launch configuration in VSCode/Android Studio or use the following commands:

```sh
# Development
$ flutter run --flavor development --target lib/main_development.dart

# Staging
$ flutter run --flavor staging --target lib/main_staging.dart

# Production
$ flutter run --flavor production --target lib/main_production.dart
```

3. To make configurations/options based on flavors, add/update configs in `app_options.dart` class at `lib/app/assets/` directory
```dart
class DevelopmentConstant {
  static const String API_ENDPOINT = 'YOUR API URL';
}

class StagingConstant {
  static const String API_ENDPOINT = 'YOUR API URL';
}

class ProductionConstant {
  static const String API_ENDPOINT = 'YOUR API URL';
}
```

DumbDumb Flutter App works on iOS, Android



## Project Architecture Pattern (MVVM)
In this project, MVVM, aka Model-View-ViewModel is adapted as the base project architecture pattern. MVVM is useful to move business logic from view to ViewModel and Model. ViewModel is the mediator between View and Model which carry all user events and return back the result.
To learn more, may refer to [MVVM by Tech Madness] for a more detailed explaination.

In summary, core idea/components for MVVM in this starter project are:
1. Model - Represent the source of data, this layer mainly communicate with ViewModel layer for data fetching/api call/data validation
3. ViewModel - Act as the mediator between View and Model, which accept all the user events and request and forwarding to Model for data. Once the Model has data then it returns to ViewModel and then ViewModel notify that data to View.
4. View - This is the layer where widgets/layout is presenting the data to user, for any user action/requests, it will forward to ViewModel layer and get updated once job completed in ViewModel and Model layer.

### Model Layer
1. Model data class is defining the structure of data to be used
    ```dart
    class TokenModel {

      TokenModel({this.accessToken, this.refreshToken});

      String? accessToken;
      String? refreshToken;
    }
    ```
2. Service class is defining the web API services
   1. `lib/app/service/base_services.dart` is provided to unified the api request instance, including user authorization session with JWT authentication.
   2. New service should extends BaseServices to inherit the basic unified features included.
       ```dart
       class UserServices extends BaseServices {
           Future<MyResponse> login(String username, String password) async {
             String path = '${apiUrl()}/login';
             var postBody = {
               'username': username,
               'password': password
             };
             return callAPI(HttpRequestType.POST, path, postBody: postBody);
           }
         }
         ```

3. Repository class is defining the business logic for accessing data source, eg: getting data from multiple source and compiled as one data type before passing back to ViewModel.
   ```dart
   class UserRepository {
      UserServices _userServices = UserServices();

      Future<MyResponse> login(String username, String password) async {
        return await _userServices.login(username, password);
      }
   }
   ```

### View Model Layer
1. ViewModel class as a connector between View and Model, separating View and Model to segregate business logic from UI, by accepting all request from View and perform related request through Model Layer.
2. One ViewModel class may serve multiple View classes. (ensuring Extensibility and Maintainability)
3. `lib/app/viewmodel/base_view_model.dart` class is provided to unified common action required, eg: notify(), notifyUrgent() and more.
4. New ViewModel classes should extends BaseViewModel to inherit the basic unified features included.
   ```dart
   class LoginViewModel extends BaseViewModel {
      Future<void> login(String username, String password) async {
        notify(MyResponse.loading());
        response = await UserRepository().login(username, password);
        notify(response);
      }

### View Layer
1. View layer are the presentation layer, where include all the UI classes, eg: Widgets, Pages
2. `lib/app/view/base_stateful_page.dart` and `lib/app/view/base_stateless_page.dart` is provided to unified common UI behaviour and UI presentation logic across all screen in the app.
3. New View classes should extends BaseStatefulPage or BaseStatelessPage to inherit the basic unified features included.
   ```dart
   class LoginPage extends BaseStatefulPage {
    @override
    State<StatefulWidget> createState() => _LoginPageState();
   }

   class _LoginPageState extends BaseStatefulState<LoginPage> {
      @override
      Widget body() {
        MyResponse myResponse = Provider.of<LoginViewModel>(context).response;
        return Center(child: userInfoText(myResponse));
      }

      @override
      Widget floatingActionButton() {
        return FloatingActionButton(
          onPressed: () => Provider.of<LoginViewModel>(context, listen: false).login("60161234567", "Abcd1234"),
          child: const Icon(Icons.login),
        );
      }
   }



## State Management Tool

This project relies on [Provider] which taking the [Official_Simple app state management] as base reference. [Provider] is use along with MVVM architectural pattern to provide better separation and management within the project.

Core concepts in [Provider]:
1. [ChangeNotifier]
2. [ChangeNotifierProvider]
3. [Provider.Of]



### Using the Provider
1. To simplified and standardize the usage of Provider in this project, a base class, base_view_model.dart is provided which extending the ChangeNotifier and include common functions/fields required. (eg: notify(), notifyUrgent() and more)
2. ChangeNotifierProviders are implemented in the top inheritance level of the project (app.dart) which using MultiProvider to support multiple providers within the project.
3. For any new ViewModel class/Provider, please register in the `lib/app/asset/app_options.dart`
```dart
List<SingleChildWidget> providerAssets() => [
  ChangeNotifierProvider.value(value: BaseViewModel()),
  ChangeNotifierProvider.value(value: LoginViewModel())
];
```
4. To access provider values:
```dart
MyResponse myResponse = Provider.of<LoginViewModel>(context).response;
```
5. To access provider without listen for changes:
```dart
Provider.of<LoginViewModel>(context, listen: false).login("60161234567", "Abcd1234")
```



## Routing with Go_Router
This project using router to navigating between screens and handling deep links. [go_router](https://pub.dev/packages/go_router) package is used which can help to parse the route path and configure the Navigator whenever the app receives a new deep link. 

### Declaring Routes
1. `lib/app/assets/router/app_router.dart` is the main class to provide the configuration of the routes.
2. For any new screens or new routes, you may add in the [GoRoute](https://pub.dev/documentation/go_router/latest/go_router/GoRoute-class.html) object into the [GoRouter](https://pub.dev/documentation/go_router/latest/go_router/GoRouter-class.html) constructor.

#### GoRoute
To configure a `GoRoute`, a path template and builder must be provided. Specifiy a path template to handle by providing a `path` parameter, and a builder by providing either the `builder` or `pageBuulder` parameter:

```dart
final GoRouter router = GoRouter(routes: [
  GoRoute(path: '/login', builder: (context, state) => LoginPage())
]);
```

#### Child Routes
A matched route can result in more than one screen being displayed on a Nvigator. This is equivalent to calling `push()', where a new screen is displayed above the previous screen with a transition animation.

To display a screen on top of another, add a child route by adding it to the parent route's `routes' list:
```dart
final GoRouter router = GoRouter(routes: [
  GoRoute(path: '/login', builder: (context, state) => LoginPage()),
  GoRoute(path: 'profile', builder: (context, state) => HomePage(initialIndex: 4), routes: [
     GoRoute(
	path: 'editProfile',
	builder: (context, state) => EditBasicInfoPage(),
	routes: [
		GoRoute(path: 'changePhoneNumber', builder: (context, state) => ChangePhoneNumberPage())]),
		GoRoute(path: 'changeLanguage', builder: (context, state) => LanguageListPage())
     ])
]);
```

### Navigation and Redirection
#### Go directly to a destination
Navigating to a destination in GoRouter will replace the current stack of screens with the screens configured to be displayed for the destination route. To change to a new screen, call `context.go()` with a URL:
```dart
context.go('/login');
```

#### Imperative navigation
GoRouter can push a screen onto the Navigator's history stack using `context.push()`, and can pop the current screen via `context.pop()`. However, imperative navigation is known to cause issues with the browser history.

#### Returning values
You can wait for a value to be returned from the destination:

Initial page:
```dart
await context.go('/login');
if(result...) ...
```

Returning page:
```dart
context.pop(someResult);
```



## Working with Firebase

This project integrated Firebase product such as Firebase Cloud Messaging, Analytics, as well as Crashlytic for app analytic and performance monitoring. The integration of Firebase components are following the [Add Firebase to your Flutter app].

### Firebase Configuration
1. To update configuration key and identifiers, look for firebase_options.dart class and update the respective configuration accordingly.
```dart
static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'YOUR API KEY',
    appId: 'YOUR APP ID',
    messagingSenderId: 'MESSAGING SENDER ID',
    projectId: 'YOUR PROJECT ID',
    storageBucket: 'YOUR STORAGE BUCKET',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'YOUR API KEY',
    appId: 'YOUR APP ID',
    messagingSenderId: 'MESSAGING SENDER ID',
    projectId: 'YOUR PROJECT ID',
    storageBucket: 'YOUR STORAGE BUCKET',
  );
  
  static const FirebaseOptions ios_stag = FirebaseOptions(
    apiKey: 'YOUR API KEY',
    appId: 'YOUR APP ID',
    messagingSenderId: 'MESSAGING SENDER ID',
    projectId: 'YOUR PROJECT ID',
    storageBucket: 'YOUR STORAGE BUCKET',
  );

  static const FirebaseOptions ios_dev = FirebaseOptions(
   apiKey: 'YOUR API KEY',
    appId: 'YOUR APP ID',
    messagingSenderId: 'MESSAGING SENDER ID',
    projectId: 'YOUR PROJECT ID',
    storageBucket: 'YOUR STORAGE BUCKET',
  );
```

### Firebase Cloud Messaging
1. A basic notification_handler.dart is included within the project, which handled Firebase initialization and receiving message in foreground+background.
2. Further action when receiving message can be configured:
```dart
FirebaseMessaging.onMessage.listen((RemoteMessage message) { });

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async { }
```


## Working with Translations 🌐

This project relies on [flutter_localizations][flutter_localizations_link] and follows the [official internationalization guide for Flutter][internationalization_link].

### Adding Strings

1. To add a new localizable string, open the `app_en.arb` file at `lib/l10n/arb/app_en.arb`.

```arb
{
    "@@locale": "en",
    "counterAppBarTitle": "Counter",
    "@counterAppBarTitle": {
        "description": "Text shown in the AppBar of the Counter Page"
    }
}
```

2. Then add a new key/value and description

```arb
{
    "@@locale": "en",
    "counterAppBarTitle": "Counter",
    "@counterAppBarTitle": {
        "description": "Text shown in the AppBar of the Counter Page"
    },
    "helloWorld": "Hello World",
    "@helloWorld": {
        "description": "Hello World Text"
    }
}
```

3. Use the new string

```dart
import 'package:dumbdumb_flutter_app/l10n/l10n.dart';

@override
Widget build(BuildContext context) {
  final l10n = context.l10n;
  return Text(l10n.helloWorld);
}
```

### Adding Supported Locales

Update the `CFBundleLocalizations` array in the `Info.plist` at `ios/Runner/Info.plist` to include the new locale.

```xml
    ...

    <key>CFBundleLocalizations</key>
	<array>
		<string>en</string>
		<string>es</string>
	</array>

    ...
```

### Adding Translations

1. For each supported locale, add a new ARB file in `lib/l10n/arb`.

```
├── l10n
│   ├── arb
│   │   ├── app_en.arb
│   │   └── app_es.arb
```

2. Add the translated strings to each `.arb` file:

`app_en.arb`

```arb
{
    "@@locale": "en",
    "counterAppBarTitle": "Counter",
    "@counterAppBarTitle": {
        "description": "Text shown in the AppBar of the Counter Page"
    }
}
```

`app_es.arb`

```arb
{
    "@@locale": "es",
    "counterAppBarTitle": "Contador",
    "@counterAppBarTitle": {
        "description": "Texto mostrado en la AppBar de la página del contador"
    }
}
```

## Credits

A big thanks and appreciation to the good work from [very_good_cli] teams, as this project is taking base reference from the sample project created using [very_good_cli]. We learn a lot from their outstanding "very good core" which support multi flavoring, localization and many more out of the box.
In this dumbdumb project, we are slimming down the package, applying various mod and elements on top of it, to make it as an more product oriented and ready to use starter pack for Flutter project.

[coverage_badge]: coverage_badge.svg
[flutter_localizations_link]: https://api.flutter.dev/flutter/flutter_localizations/flutter_localizations-library.html
[internationalization_link]: https://flutter.dev/docs/development/accessibility-and-localization/internationalization
[license_badge]: https://img.shields.io/badge/license-MIT-blue.svg
[license_link]: https://opensource.org/licenses/MIT
[Add Firebase to your Flutter app]: https://firebase.google.com/docs/flutter/setup?platform=ios
[Official_Simple app state management]: https://docs.flutter.dev/development/data-and-backend/state-mgmt/simple
[Provider]: https://pub.dev/packages/provider
[ChangeNotifier]: https://docs.flutter.dev/development/data-and-backend/state-mgmt/simple#changenotifier
[ChangeNotifierProvider]: https://docs.flutter.dev/development/data-and-backend/state-mgmt/simple#changenotifierprovider
[Provider.Of]: https://docs.flutter.dev/development/data-and-backend/state-mgmt/simple#providerof
[MVVM by Tech Madness]: https://medium.com/flutterworld/flutter-mvvm-architecture-f8bed2521958
[very_good_cli]: https://github.com/VeryGoodOpenSource/very_good_cli
