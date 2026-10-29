import '../entities/user_profile.dart';

abstract class UserRepository {
  Stream<UserProfile?> watchUserProfile(String uid);

  Future<void> createUserProfile(UserProfile profile);

  Future<void> updateDisplayName(String uid, String name);
}
