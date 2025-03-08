import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:meta/meta.dart';
import 'package:weather_app/features/login/auth/data/domin/entites/user_entity.dart';
import 'package:weather_app/features/login/auth/data/domin/repos/auth_repos.dart';


part 'signin_state.dart';

class SigninCubit extends Cubit<SigninState> {
  SigninCubit(this.authRepo) : super(SigninInitial());
  final AuthRepo authRepo;
  final FlutterSecureStorage secureStorage = const FlutterSecureStorage();

  Future<void> signin(String email, String password) async {
    emit(SigninLoading());
    var result = await authRepo.signInWithEmailAndPassword(
      email,
      password,
    );
    result.fold(
      (failure) => emit(SigninFailure(message: failure.message)),
      (userEntity) => emit(SigninSuccess(userEntity: userEntity)),
    );
  }

 Future<void> signinWithGoogle() async {
    emit(SigninLoading());

    final result = await authRepo.signInWithGoogle();
    result.fold(
      (failure) => emit(SigninFailure(message: failure.message)),
      (userEntity) async {
        await _saveUid(userEntity.uId);
        emit(SigninSuccess(userEntity: userEntity));
      },
    );
  }
  Future<void> signinWithFacebook() async {
    emit(SigninLoading());
    var result = await authRepo.signInWithFacebook();
    result.fold(
      (failure) => emit(SigninFailure(message: failure.message)),
      (userEntity) => emit(SigninSuccess(userEntity: userEntity)),
    );
  }
  Future<void> _saveUid(String uid) async {
    try {
      await secureStorage.write(key: 'uid', value: uid);
      debugPrint('UID successfully saved: $uid'); // Debug print
    } catch (e) {
      debugPrint('Failed to save UID: $e'); // Debug print for errors
    }
  }


}
