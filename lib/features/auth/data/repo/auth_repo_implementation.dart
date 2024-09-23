import 'package:either_dart/either.dart';
import 'package:weather_app/core/errors/failur.dart';
import 'package:weather_app/core/services/data_service.dart';
import 'package:weather_app/core/services/firebase_auth_services.dart';
import 'package:weather_app/core/utiles/backend_endpoint.dart';
import 'package:weather_app/features/auth/data/domin/entites/user_entity.dart';
import 'package:weather_app/features/auth/data/domin/repos/auth_repos.dart';
import 'package:weather_app/features/auth/data/model/user_model.dart';

class AuthRepoImplementation extends AuthRepo {
  final FirebaseServices firebaseServices;
  final DataBaseServices dataBaseServices;
  AuthRepoImplementation(
      {required this.dataBaseServices, required this.firebaseServices});

  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
      String email, String password, String name) async {
    try {
      var user = await firebaseServices.createUserWithEmailAndPassword(
          email: email, password: password);
      var userEntity = UserModel.fromFirestore(user);
      await setUserData(userEntity: userEntity);
      return Right(userEntity);
    } on Exception catch (e) {
      return Left(
        ServerFailure('حدث خطأ ما. الرجاء المحاولة مرة اخرى.'),
      );
    } catch (e) {
      return Left(
        ServerFailure(
          'حدث خطأ ما. الرجاء المحاولة مرة اخرى.',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      var user = await firebaseServices.signInWithEmailAndPassword(
          email: email, password: password);
      return Right(UserModel.fromFirestore(user));
    } on Exception catch (e) {
      return Left(
        ServerFailure('حدث خطأ ما. الرجاء المحاولة مرة اخرى.'),
      );
    } catch (e) {
      return Left(
        ServerFailure(
          'حدث خطأ ما. الرجاء المحاولة مرة اخرى.',
        ),
      );
    }
  }

  @override
  Future setUserData({required UserEntity userEntity}) async {
    await dataBaseServices.setData(
        path: BackendEndpoint.setUserData, data: userEntity.toMap());
  }
}
