// Copyright (c) 2022, DumbDumb
// https://dumbdumb.com
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'app/assets/exporter/importer_app_general.dart';
import 'app/utils/starter_handler.dart';
import 'app/view/app.dart';

Future<void> main() async {
  // An init() Function to perform all required initial configuration before app start running
  await init(EnvironmentType.staging);

  // Start to run the app
  runApp(const App());
}
