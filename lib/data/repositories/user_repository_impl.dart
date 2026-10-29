import '../../domain/entities/user_profile.dart';
import '../../domain/repositories/user_repository.dart';
import '../datasources/firestore_user_datasource.dart';

class UserRepositoryImpl implements UserRepository {
  UserRepositoryImpl(this._dataSource);

  final FirestoreUserDataSource _dataSource;

  @override
  Stream<UserProfile?> watchUserProfile(String uid) {
    return _dataSource.watchUser(uid).map((snapshot) {
      final data = snapshot.data();
      if (data == null) return null;
      return UserProfile.fromMap(uid, data);
    });
  }

  @override
  Future<void> createUserProfile(UserProfile profile) {
    return _dataSource.createUser(profile.uid, profile.toMap());
  }

  @override
  Future<void> updateDisplayName(String uid, String name) {
    return _dataSource.updateUser(uid, {'name': name});
  }
}
