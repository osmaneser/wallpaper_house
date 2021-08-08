import 'package:get_it/get_it.dart';
import 'package:wallpaper_house/ui/modules/category/category_view_model.dart';
import 'package:wallpaper_house/ui/modules/home/home_view_model.dart';
import 'package:wallpaper_house/ui/modules/home/image_detail_view_model.dart';
import 'package:wallpaper_house/ui/repositories/main_repository.dart';

GetIt locator = GetIt.instance;

setupLocator() {
  locator.registerLazySingleton(() => MainRepository());
  locator.registerLazySingleton(() => HomeViewModel());
  locator.registerLazySingleton(() => ImageDetailViewModel());
  locator.registerLazySingleton(() => CategoryViewModel());
}
