import 'package:wallpaper_house/core/models/base_view_model.dart';
import 'package:wallpaper_house/ui/models/res_image.dart';

class HomeViewModel extends BaseViewModel {
  List<ResImage> _listImage = [
    ResImage(
      id: 1,
      name: "Tatlı",
      imgUrl: "https://osmaneser.com/saheser/category/tatli.jpg",
      categoryId: 1,
    ),
    ResImage(
      id: 1,
      name: "Kuzu Haşlama",
      imgUrl: "https://osmaneser.com/saheser/kuzular/kuzu-haslama.jpg",
      categoryId: 1,
    ),
    ResImage(
      id: 1,
      name: "Kıymalı Pide",
      imgUrl: "https://osmaneser.com/saheser/pideler/kiymali.jpg",
      categoryId: 2,
    ),
    ResImage(
      id: 1,
      name: "Çoban Salata",
      imgUrl: "https://osmaneser.com/saheser/soguk/coban-salata.jpg",
      categoryId: 2,
    ),
    ResImage(
      id: 1,
      name: "Fırın Makarna",
      imgUrl: "https://osmaneser.com/saheser/yan/firin-Makarna.jpg",
      categoryId: 3,
    ),
    ResImage(
      id: 1,
      name: "Patlıcan Kebap",
      imgUrl: "https://osmaneser.com/saheser/sulu/patlican-kebap.jpg",
      categoryId: 4,
    ),
    ResImage(
      id: 1,
      name: "Kuzu Tandır",
      imgUrl: "https://osmaneser.com/saheser/kuzular/kuzu-tandir.jpg",
      categoryId: 5,
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
