import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/repository_providers.dart';

final onboardingControllerProvider = NotifierProvider<OnboardingController, bool>(
  OnboardingController.new,
);

class OnboardingController extends Notifier<bool> {
  @override
  bool build() => ref.watch(onboardingRepositoryProvider).isOnboardingComplete();

  Future<void> complete() async {
    await ref.read(onboardingRepositoryProvider).setOnboardingComplete();
    state = true;
  }
}
