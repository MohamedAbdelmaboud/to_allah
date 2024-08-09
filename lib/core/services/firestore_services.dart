import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:to_allah/core/helpers/date_to_string.dart';
import 'package:to_allah/core/helpers/print.dart';
import 'package:to_allah/core/models/failure.dart';
import 'package:to_allah/core/utils/app_keys.dart';
import 'package:to_allah/features/home/data/models/table_data_model.dart';
import 'package:to_allah/features/home/data/models/user_data_model.dart';

import '../../features/login/models/user_auth.dart';

class FirestoreServices {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  static Future<Either<Failure, List<UserAuth>>> getUserAuthList() async {
    try {
      final snapshot = await _firestore.collection(AppKeys.userAuth).get();
      final users =
          snapshot.docs.map((doc) => UserAuth.fromJson(doc.data())).toList();
      return right(users);
    } on Exception catch (e) {
      Print.error(e.toString());
      return left(Failure(e.toString()));
    }
  }

  static Future<Either<Failure, List<UserDataModel>>> getUsersData() async {
    try {
      // Get the list of users
      final usersSnapshot =
          await _firestore.collection(AppKeys.usersData).get();

      final List<UserDataModel> usersData = [];
      // Loop through each user
      for (final doc in usersSnapshot.docs) {
        // Get snapshot of table data sorted by dayIndex
        final userSnapshot = await _firestore
            .collection(AppKeys.usersData)
            .doc(doc.id) // doc.id is the username
            .collection(AppKeys.tablesData)
            .orderBy('dayIndex')
            .get();

        // Convert the table data snapshot to a list
        final tableData = userSnapshot.docs
            .map((doc) => TableDataModel.fromJson(doc.data()))
            .toList();

        // Create the user data model
        final userData = UserDataModel(
          username: doc.id,
          data: tableData,
        );

        // Add the user data to the list
        usersData.add(userData);
      }
      return right(usersData);
    } on Exception catch (e) {
      Print.error(e.toString());
      return left(Failure(e.toString()));
    }
  }

  static Future<Either<Failure, void>> addDayDoc({
    required String username,
    required TableDataModel tableData,
  }) async {
    try {
      _firestore
          .collection(AppKeys.usersData)
          .doc(username)
          .collection(AppKeys.tablesData)
          .doc(dateToString(tableData.dayDate))
          .set(tableData.toJson());
      return right(null);
    } on Exception catch (e) {
      Print.error(e.toString());
      return left(Failure(e.toString()));
    }
  }

  static Future<Either<Failure, void>> updateTableData({
    required String username,
    required TableDataModel tableData,
  }) async {
    try {
      _firestore
          .collection(AppKeys.usersData)
          .doc(username)
          .collection(AppKeys.tablesData)
          .doc(dateToString(tableData.dayDate))
          .update(tableData.toJson());
      return right(null);
    } on Exception catch (e) {
      Print.error(e.toString());
      return left(Failure(e.toString()));
    }
  }
}
