import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/user_profile.dart';
import '../auth/auth_controller.dart';
import '../providers/repository_providers.dart';

/// Streams the signed-in user's Firestore profile, or null when signed out.
final currentUserProfileProvider = StreamProvider<UserProfile?>((ref) {
  final uid = ref.watch(authStateChangesProvider).valueOrNull;
  if (uid == null) return Stream.value(null);
  return ref.watch(userRepositoryProvider).watchUserProfile(uid);
});
