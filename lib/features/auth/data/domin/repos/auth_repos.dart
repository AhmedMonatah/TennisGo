import 'package:either_dart/either.dart';
import 'package:weather_app/core/errors/failur.dart';
import 'package:weather_app/features/auth/data/domin/entites/user_entity.dart';

abstract class AuthRepo{
  Future<Either<Failure,UserEntity>> createUserWithEmailAndPassword(String email, String password,String name);
  Future<Either<Failure,UserEntity>> signInWithEmailAndPassword(String email, String password);

  Future setUserData({required UserEntity userEntity});
}