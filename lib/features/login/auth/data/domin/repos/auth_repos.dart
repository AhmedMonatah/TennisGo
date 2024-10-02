import 'package:either_dart/either.dart';
import 'package:weather_app/core/errors/failur.dart';
import 'package:weather_app/features/login/auth/data/domin/entites/user_entity.dart';

abstract class AuthRepo{
  Future<Either<Failure,UserEntity>> createUserWithEmailAndPassword(String email, String password,String name);
  Future<Either<Failure,UserEntity>> signInWithEmailAndPassword(String email, String password);

  Future addUserData({required UserEntity user});
  Future saveUserData({required UserEntity user});
   Future<UserEntity> getUserData({required String uid});
}