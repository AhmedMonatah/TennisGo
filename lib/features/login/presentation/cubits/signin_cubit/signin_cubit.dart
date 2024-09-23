import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:weather_app/features/login/auth/data/domin/entites/user_entity.dart';
import 'package:weather_app/features/login/auth/data/domin/repos/auth_repos.dart';


part 'signin_state.dart';

class SigninCubit extends Cubit<SigninState> {
  SigninCubit(this.authRepo) : super(SigninInitial());
  final AuthRepo authRepo;

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




}
