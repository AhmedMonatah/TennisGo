import 'package:firebase_auth/firebase_auth.dart';
import 'package:weather_app/features/auth/data/domin/entites/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({required super.email, required super.name, required super.uId});
  factory UserModel.fromFirestore(User user) {
    return UserModel(
        email: user.email??'', name: user.displayName??'', uId: user.uid);
  }
}
