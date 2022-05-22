import 'package:complete_advanced_flutter/app/app.dart';
import 'package:complete_advanced_flutter/app/dependency_injection.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initAppModule();
  runApp(MyApp());
}
