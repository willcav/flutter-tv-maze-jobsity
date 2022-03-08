import 'package:flutter/material.dart';

import 'src/app.dart';
import 'src/dependency_injection/injection_container.dart' as di;

void main() async {
  await di.init();
  runApp(const App());
}
