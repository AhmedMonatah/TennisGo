import 'package:weather_app/core/services/data_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreService implements DataBaseServices{
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Future<void> setData (
      {required String path, required Map<String, dynamic> data}) async {
    await firestore.collection(path).add(data);
  }


}


