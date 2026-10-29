import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreUserDataSource {
  FirestoreUserDataSource(this._firestore);

  final FirebaseFirestore _firestore;

  CollectionReference<Map<String, dynamic>> get _users => _firestore.collection('users');

  Stream<DocumentSnapshot<Map<String, dynamic>>> watchUser(String uid) {
    return _users.doc(uid).snapshots();
  }

  Future<void> createUser(String uid, Map<String, dynamic> data) {
    return _users.doc(uid).set(data);
  }

  Future<void> updateUser(String uid, Map<String, dynamic> data) {
    return _users.doc(uid).update(data);
  }
}
