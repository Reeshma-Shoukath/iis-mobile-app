import 'package:firebase_auth/firebase_auth.dart';

import '../../core/app_exception.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/firebase_auth_datasource.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(this._authDataSource);

  final FirebaseAuthDataSource _authDataSource;

  @override
  Stream<String?> authStateChanges() {
    return _authDataSource.authStateChanges().map((user) => user?.uid);
  }

  @override
  String? get currentUserId => _authDataSource.currentUser?.uid;

  @override
  Future<void> signIn({required String email, required String password}) async {
    try {
      await _authDataSource.signIn(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw AppException(_mapAuthError(e));
    }
  }

  @override
  Future<String> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final credential = await _authDataSource.signUp(email: email, password: password);
      await _authDataSource.updateDisplayName(name);
      return credential.user!.uid;
    } on FirebaseAuthException catch (e) {
      throw AppException(_mapAuthError(e));
    }
  }

  @override
  Future<void> signOut() => _authDataSource.signOut();

  String _mapAuthError(FirebaseAuthException e) {
    switch (e.code) {
      case 'invalid-email':
        return 'That email address looks invalid.';
      case 'user-not-found':
      case 'invalid-credential':
        return 'No account found for those credentials.';
      case 'wrong-password':
        return 'Incorrect password. Please try again.';
      case 'email-already-in-use':
        return 'An account already exists with that email.';
      case 'weak-password':
        return 'Please choose a stronger password.';
      case 'network-request-failed':
        return 'Network error. Check your connection and try again.';
      default:
        return 'Something went wrong. Please try again.';
    }
  }
}
