import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app_colors.dart';
import 'firebase_options.dart';
import 'presentation/core/auth_gate.dart';
import 'presentation/providers/firebase_providers.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  final prefs = await SharedPreferences.getInstance();

  runApp(
    ProviderScope(
      overrides: [sharedPreferencesProvider.overrideWithValue(prefs)],
      child: const IisApp(),
    ),
  );
}

class IisApp extends StatelessWidget {
  const IisApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IIS Mobile Application',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: AppColors.background,
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryPurple),
      ),
      home: const AuthGate(),
    );
  }
}
