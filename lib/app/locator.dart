import 'package:get_it/get_it.dart';
import 'package:note_muse/services/state_services/user_service.dart';

final locator = GetIt.instance;

setupLocator() {
  locator.registerLazySingleton(() => UserService());
}
