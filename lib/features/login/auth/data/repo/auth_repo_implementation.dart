import 'dart:convert';
import 'dart:developer';

import 'package:either_dart/either.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:weather_app/core/errors/exception.dart';
import 'package:weather_app/core/errors/failur.dart';
import 'package:weather_app/core/services/data_service.dart';
import 'package:weather_app/core/services/firebase_auth_services.dart';
import 'package:weather_app/core/services/shared_preferences_singleton.dart';
import 'package:weather_app/core/utiles/backend_endpoint.dart';
import 'package:weather_app/core/utiles/constant.dart';
import 'package:weather_app/features/login/auth/data/domin/entites/user_entity.dart';
import 'package:weather_app/features/login/auth/data/domin/repos/auth_repos.dart';
import 'package:weather_app/features/login/auth/data/model/user_model.dart';

class AuthRepoImplementation extends AuthRepo {
  final FirebaseServices firebaseServices;
  final DataBaseServices dataBaseServices;
  AuthRepoImplementation(
      {required this.dataBaseServices, required this.firebaseServices});
  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
      String email, String password, String name) async {
    User? user;
    try {
      user = await firebaseServices.createUserWithEmailAndPassword(
          email: email, password: password);
      var userEntity = UserEntity(
        name: name,
        email: email,
        uId: user.uid,
      );
      await addUserData(user: userEntity);
      return Right(userEntity);
    } on CustomeException catch (e) {
      await deleteUser(user);
      return Left(ServerFailure(e.message));
    } catch (e) {
      await deleteUser(user);
      log(
        'Exception in AuthRepoImpl.createUserWithEmailAndPassword: ${e.toString()}',
      );
      return Left(
        ServerFailure(
          'حدث خطأ ما. الرجاء المحاولة مرة اخرى.',
        ),
      );
    }
  }

  Future<void> deleteUser(User? user) async {
    if (user != null) {
      await firebaseServices.deleteUser();
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      var user = await firebaseServices.signInWithEmailAndPassword(
          email: email, password: password);
      var userEntity = await getUserData(uid: user.uid);
      await saveUserData(user: userEntity);
      return Right(
        userEntity,
      );
    } on CustomeException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      log(
        'Exception in AuthRepoImpl.createUserWithEmailAndPassword: ${e.toString()}',
      );
      return Left(
        ServerFailure(
          'حدث خطأ ما. الرجاء المحاولة مرة اخرى.',
        ),
      );
    }
  }


  @override
  Future addUserData({required UserEntity user}) async {
    await dataBaseServices.addData(
      path: BackendEndpoint.addUserData,
      data: UserModel.fromEntity(user).toMap(),
      documentId: user.uId,
    );
  }

  @override
  Future<UserEntity> getUserData({required String uid}) async {
    var userData = await dataBaseServices.getData(
        path: BackendEndpoint.getUsersData, docuementId: uid);
    return UserModel.fromJson(userData);
  }

  @override
  Future saveUserData({required UserEntity user}) async {
    var jsonData = jsonEncode(UserModel.fromEntity(user).toMap());
    await Prefs.setString(kUserData, jsonData);
  }
}
