import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../screens/root_screen.dart';
import '../auth/auth_controller.dart';
import '../auth/login_screen.dart';
import '../onboarding/onboarding_controller.dart';
import '../onboarding/onboarding_screen.dart';
import '../splash/splash_screen.dart';

/// Decides which top-level flow to show: splash, onboarding, login, or the app shell.
class AuthGate extends ConsumerWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final onboardingComplete = ref.watch(onboardingControllerProvider);
    final authState = ref.watch(authStateChangesProvider);

    return authState.when(
      loading: () => const SplashScreen(),
      error: (error, stackTrace) => const LoginScreen(),
      data: (uid) {
        if (!onboardingComplete) return const OnboardingScreen();
        if (uid == null) return const LoginScreen();
        return const RootScreen();
      },
    );
  }
}
