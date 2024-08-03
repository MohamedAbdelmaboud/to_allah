import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:to_allah/core/helpers/print.dart';
import 'package:to_allah/core/models/failure.dart';
import 'package:to_allah/core/utils/app_keys.dart';

import '../../features/login/models/user_auth.dart';

class FirestoreServices {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  static Future<QuerySnapshot<Map<String, dynamic>>> _getCollection({
    required String collectionName,
  }) async {
    return await _firestore.collection(collectionName).get();
  }

  static Future<DocumentSnapshot<Map<String, dynamic>>> _getDocument({
    required String collectionName,
    required String documentId,
  }) async {
    return await _firestore.collection(collectionName).doc(documentId).get();
  }

  static Future<void> _addDocument({
    required String collectionName,
    required Map<String, dynamic> data,
  }) async {
    await _firestore.collection(collectionName).add(data);
  }

  static Future<Either<Failure, List<UserAuth>>> getUserAuthList() async {
    try {
      final snapshot = await _getCollection(collectionName: AppKeys.userAuth);
      final users =
          snapshot.docs.map((doc) => UserAuth.fromJson(doc.data())).toList();
      return right(users);
    } on Exception catch (e) {
      Print.error(e.toString());
      return left(Failure(e.toString()));
    }
  }
}
