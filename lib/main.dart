import 'package:flutter/material.dart';
import 'package:solid_software/service_locator/service_locator.dart';
import 'package:solid_software/solid_test_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configDI();

  runApp(const SolidTestApp());
}
