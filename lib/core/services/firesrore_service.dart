import 'package:flutter/material.dart';
import 'package:weather_app/core/services/data_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreService implements DataBaseServices{
  FirebaseFirestore firestore = FirebaseFirestore.instance;
 @override
  Future<void> addData(
      {required String path,
      required Map<String, dynamic> data,
      String? documentId}) async {
    if (documentId != null) {
      firestore.collection(path).doc(documentId).set(data);
    } else {
      await firestore.collection(path).add(data);
    }
  }

 @override
  Future<dynamic> getData(
      {required String path,
      String? docuementId,
      Map<String, dynamic>? query}) async {
    if (docuementId != null) {
      var data = await firestore.collection(path).doc(docuementId).get();
      return data.data();
    } else {
      Query<Map<String, dynamic>> data = firestore.collection(path);
      if (query != null) {
        if (query['orderBy'] != null) {
          var orderByField = query['orderBy'];
          var descending = query['descending'];
          data = data.orderBy(orderByField, descending: descending);
        }
        if (query['limit'] != null) {
          var limit = query['limit'];
          data = data.limit(limit);
        }

      }
      var result = await data.get();
      return result.docs.map((e) => e.data()).toList();
    }
  }
  
  @override
  Future<bool> checkIfDataExists(
      {required String path, required String docuementId}) async {
    var data = await firestore.collection(path).doc(docuementId).get();
    return data.exists;
  }
   @override
  Future<void> setData({
    required String path,
    required Map<String, dynamic> data,
  }) async {
    try {
      // Use `set` with the user's UID as the document ID
      await firestore.collection(path).doc(data['uId']).set(data);
    } catch (e) {
      debugPrint('Error saving data to Firestore: $e');
      throw Exception('Failed to save data');
    }
  }

}


