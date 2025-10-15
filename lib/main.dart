import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:front_mans_firebase/core/di/module.dart';

import 'firebase_options.dart';
import 'my_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setupModule();
  runApp(const MyApp());
}
