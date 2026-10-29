abstract class AuthRepository {
  Stream<String?> authStateChanges();

  String? get currentUserId;

  Future<void> signIn({required String email, required String password});

  Future<String> signUp({
    required String name,
    required String email,
    required String password,
  });

  Future<void> signOut();
}
