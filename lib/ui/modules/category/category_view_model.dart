import 'package:wallpaper_house/core/models/base_view_model.dart';
import 'package:wallpaper_house/ui/models/res_category.dart';

class CategoryViewModel extends BaseViewModel {
  int selectedCategoryId = 0;
  final listCategory = [
    ResCategory(id: 0, name: "Tümü"),
    ResCategory(id: 1, name: "Atatürk"),
    ResCategory(id: 2, name: "Osmanlı"),
    ResCategory(id: 3, name: "Türkiye"),
    ResCategory(id: 4, name: "Almanya"),
    ResCategory(id: 5, name: "Hollanda"),
    ResCategory(id: 6, name: "İkoçya"),
    ResCategory(id: 7, name: "Orman"),
    ResCategory(id: 8, name: "Sanat"),
  ];

  Future<void> changeCategory(int id) async {
    state = BaseState.Busy;
    selectedCategoryId = id;
    state = BaseState.Done;
  }
}
