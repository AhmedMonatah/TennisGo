import 'package:weather_app/core/services/data_service.dart';
import 'package:weather_app/core/services/firebase_auth_services.dart';
import 'package:weather_app/core/services/firesrore_service.dart';
import 'package:get_it/get_it.dart';

import 'package:weather_app/features/login/auth/data/domin/repos/auth_repos.dart';
import 'package:weather_app/features/login/auth/data/repo/auth_repo_implementation.dart';

final getit=GetIt.instance;
void setup(){
  getit.registerSingleton<FirebaseServices>(FirebaseServices());
  getit.registerSingleton<DataBaseServices>(FireStoreService());
  getit.registerSingleton<AuthRepo>(AuthRepoImplementation(
    firebaseServices: getit<FirebaseServices>(),
    dataBaseServices: getit<DataBaseServices>(),  
  ));
}
