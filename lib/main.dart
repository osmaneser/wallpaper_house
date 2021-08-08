import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallpaper_house/ui/modules/category/category_view_model.dart';
import 'package:wallpaper_house/ui/modules/home/home_view_model.dart';
import 'package:wallpaper_house/ui/modules/home/image_detail_view_model.dart';

import 'core/constants/global_constants.dart';
import 'core/init/locator.dart';
import 'ui/modules/home/home_page.dart';
void main() {
  setupLocator();
  runApp(
    MultiProvider(
      builder: (context, child) {
        return MyApp();
      },
      providers: [
        ChangeNotifierProvider(create: (context)=> HomeViewModel(),),
        ChangeNotifierProvider(create: (context)=> ImageDetailViewModel(),),
        ChangeNotifierProvider(create: (context)=> CategoryViewModel(),),
      ],
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: GlobalConstant.mainBack,
        appBarTheme: AppBarTheme(
          backgroundColor: GlobalConstant.alternativeSoft,
        )
      ),
      home: HomePage()
    );
  }
}
