import 'dart:convert';

import 'package:weather_app/core/services/shared_preferences_singleton.dart';
import 'package:weather_app/core/utiles/constant.dart';
import 'package:weather_app/features/login/auth/data/domin/entites/user_entity.dart';
import 'package:weather_app/features/login/auth/data/model/user_model.dart';

UserEntity getUser() {
  var jsonString = Prefs.getString(kUserData);
  var userEntity = UserModel.fromJson(jsonDecode(jsonString));
  return userEntity;
}