// Copyright (c) 2022, DumbDumb
// https://dumbdumb.com
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:flutter/widgets.dart';
import 'package:dumbdumb_flutter_app/app/utils/starter_handler.dart';

import 'app/assets/app_options.dart';
import 'app/view/app.dart';

Future<void> main() async {

  // An init() Function to perform all required initial configuration before app start running
  init(EnvironmentType.DEVELOPMENT);

  // Start to run the app
  runApp(const App());
}
