import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/app_exception.dart';
import '../../domain/entities/user_profile.dart';
import '../providers/repository_providers.dart';

/// Emits the current signed-in user id, or null when signed out.
final authStateChangesProvider = StreamProvider<String?>((ref) {
  return ref.watch(authRepositoryProvider).authStateChanges();
});

final authControllerProvider = AsyncNotifierProvider<AuthController, void>(AuthController.new);

class AuthController extends AsyncNotifier<void> {
  @override
  void build() {}

  Future<void> signIn({required String email, required String password}) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() {
      return ref.read(authRepositoryProvider).signIn(email: email, password: password);
    });
  }

  Future<void> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final uid = await ref.read(authRepositoryProvider).signUp(
            name: name,
            email: email,
            password: password,
          );
      await ref.read(userRepositoryProvider).createUserProfile(
            UserProfile(uid: uid, name: name, email: email, createdAt: DateTime.now()),
          );
    });
  }

  Future<void> signOut() async {
    await ref.read(authRepositoryProvider).signOut();
  }

  /// Unwraps the friendly message out of an AppException, if that's the error.
  String errorMessage(Object error) {
    return error is AppException ? error.message : 'Something went wrong. Please try again.';
  }
}
