import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/datasources/firebase_auth_datasource.dart';
import '../../data/datasources/firestore_user_datasource.dart';
import '../../data/datasources/local_prefs_datasource.dart';
import '../../data/repositories/auth_repository_impl.dart';
import '../../data/repositories/onboarding_repository_impl.dart';
import '../../data/repositories/user_repository_impl.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../domain/repositories/onboarding_repository.dart';
import '../../domain/repositories/user_repository.dart';
import 'firebase_providers.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final dataSource = FirebaseAuthDataSource(ref.watch(firebaseAuthProvider));
  return AuthRepositoryImpl(dataSource);
});

final userRepositoryProvider = Provider<UserRepository>((ref) {
  final dataSource = FirestoreUserDataSource(ref.watch(firestoreProvider));
  return UserRepositoryImpl(dataSource);
});

final onboardingRepositoryProvider = Provider<OnboardingRepository>((ref) {
  final dataSource = LocalPrefsDataSource(ref.watch(sharedPreferencesProvider));
  return OnboardingRepositoryImpl(dataSource);
});
