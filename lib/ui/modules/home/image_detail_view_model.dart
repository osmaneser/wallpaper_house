import 'package:flutter/cupertino.dart';
import 'package:image_downloader/image_downloader.dart';
import 'package:wallpaper/wallpaper.dart';
import 'package:wallpaper_house/core/models/base_view_model.dart';

class ImageDetailViewModel extends BaseViewModel {

  Future<void> setWallpaper({required BuildContext context, required String img}) async {
    String home = "Home Screen";
    Stream<String> progressString;
    String res;
    bool downloading = false;
    progressString = Wallpaper.ImageDownloadProgress(img);
    progressString.listen((data) {
      state = BaseState.Busy;
      res = data;
      downloading = true;
    }, onDone: () async {
      var width = MediaQuery.of(context).size.width;
      var height = MediaQuery.of(context).size.height;
      home = await Wallpaper.homeScreen();
      downloading = false;
      home = home;
      print("Task Done");
      state = BaseState.Done;
    }, onError: (error) {
      state = BaseState.Error;
      downloading = false;
    });
  }

  Future downloadImage(String imgUrl) async {
    state = BaseState.Busy;
    var imageId = await ImageDownloader.downloadImage(imgUrl);
    if (imageId == null) {
      state = BaseState.Error;
    } else {
      state = BaseState.Done;
    }
  }
}
