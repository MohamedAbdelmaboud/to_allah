import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:to_allah/core/utils/app_keys.dart';

import '../../features/login/ui/models/user_auth.dart';

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

  static Future<List<UserAuth>> getUserAuthList() async {
    final snapshot = await _getCollection(collectionName: AppKeys.userAuth);
    return snapshot.docs.map((doc) => UserAuth.fromJson(doc.data())).toList();
  }
}
