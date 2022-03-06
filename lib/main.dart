import 'package:flutter/material.dart';

import 'src/dependency_injection/injection_container.dart' as di;
import 'src/app.dart';

void main() async {
  await di.init();
  runApp(const App());
}
