import 'package:wallpaper_house/core/models/base_view_model.dart';
import 'package:wallpaper_house/ui/models/res_image.dart';

class HomeViewModel extends BaseViewModel {
  List<ResImage> _listImage = [
    ResImage(
      id: 1,
      name: "Atatürk Sigara",
      imgUrl: "https://osmaneser.com/wallpaper_house/ataturk/ata-1.jpg",
      categoryId: 1,
    ),
    ResImage(
      id:2,
      name: "Atatürk Bakış",
      imgUrl: "https://osmaneser.com/wallpaper_house/ataturk/ata-2.jpg",
      categoryId: 1,
    ),
    ResImage(
      id: 3,
      name: "Atatürk Poster İmza",
      imgUrl: "https://osmaneser.com/wallpaper_house/ataturk/ata-3.jpg",
      categoryId: 1,
    ),
    ResImage(
      id: 4,
      name: "Atatürk Poster",
      imgUrl: "https://osmaneser.com/wallpaper_house/ataturk/ata-4.jpg",
      categoryId: 1,
    ),
    ResImage(
      id: 5,
      name: "Atarürk Poster",
      imgUrl: "https://osmaneser.com/wallpaper_house/ataturk/ata-5.jpg",
      categoryId: 1,
    ),
    ResImage(
      id: 6,
      name: "Atatürk İmza",
      imgUrl: "https://osmaneser.com/wallpaper_house/ataturk/ata-6.jpg",
      categoryId: 1,
    ),
    ResImage(
      id: 7,
      name: "Atatürk Yandan Renkli",
      imgUrl: "https://osmaneser.com/wallpaper_house/ataturk/ata-7.jpg",
      categoryId: 1,
    ),
    ResImage(
      id: 8,
      name: "Atatürk Renkli Karşıdan",
      imgUrl: "https://osmaneser.com/wallpaper_house/ataturk/ata-8.jpg",
      categoryId: 1,
    ),
  ];

  List<ResImage> listImage = [];

  Future<void> getImages(int categoryId) async {
    state = BaseState.Busy;
    await Future.delayed(Duration(seconds: 2));
    state = BaseState.Done;
    if (categoryId == 0) {
      listImage = _listImage;
    } else {
      listImage = _listImage.where((element) => element.categoryId == categoryId).toList();
    }
  }
}
