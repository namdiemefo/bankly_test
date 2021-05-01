import 'package:bankly_test/api/repository.dart';
import 'package:bankly_test/db/prefs.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt();
void setUpLocator() {
  locator.registerLazySingleton(() => Repository());
  locator.registerLazySingleton(() => SharedPrefs());
}