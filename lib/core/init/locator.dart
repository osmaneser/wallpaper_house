import 'package:get_it/get_it.dart';
import 'package:wallpaper_house/ui/modules/home/home_view_model.dart';
import 'package:wallpaper_house/ui/repositories/main_repository.dart';

GetIt locator = GetIt.instance;

setupLocator() {
  locator.registerLazySingleton(() => MainRepository());
  locator.registerLazySingleton(() => HomeViewModel());
}
