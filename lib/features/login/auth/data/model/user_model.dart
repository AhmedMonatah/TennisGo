import 'package:firebase_auth/firebase_auth.dart';
import 'package:weather_app/features/login/auth/data/domin/entites/user_entity.dart';
class UserModel extends UserEntity {
  UserModel({required super.name, required super.email, required super.uId});
  factory UserModel.fromFirestore(User user) {
    return UserModel(
        email: user.email??'', name: user.displayName??'', uId: user.uid);
  }
  factory UserModel.fromFirebaseUser(User user) {
    return UserModel(
      name: user.displayName ?? '',
      email: user.email ?? '',
      uId: user.uid,
    );
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      email: json['email'],
      uId: json['uId'],
    );
  }

  factory UserModel.fromEntity(UserEntity user) {
    return UserModel(
      name: user.name,
      email: user.email,
      uId: user.uId,
    );
  }

  @override
  toMap() {
    return {
      'name': name,
      'email': email,
      'uId': uId,
    };
  }
}
