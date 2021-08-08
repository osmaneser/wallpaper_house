import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallpaper_house/core/constants/global_constants.dart';
import 'package:wallpaper_house/core/constants/size_constant.dart';
import 'package:wallpaper_house/core/models/base_view_model.dart';
import 'package:wallpaper_house/core/widgets/oe_custom_circular_spinner.dart';
import 'package:wallpaper_house/core/widgets/oe_custom_content_text.dart';
import 'package:wallpaper_house/ui/modules/category/category_view_model.dart';
import 'package:wallpaper_house/ui/modules/home/home_view_model.dart';

class CategoryHorizontal extends StatelessWidget {
  const CategoryHorizontal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children:
              Provider.of<CategoryViewModel>(context, listen: false).listCategory.map((e) => categoryItem(id: e.id, name: e.name)).toList(),
        ),
      ),
    );
  }

  Widget categoryItem({required int id, required String name}) {
    return Padding(
      padding: const EdgeInsets.all(SizeConstants.size8),
      child: Consumer<CategoryViewModel>(
        builder: (context, vModel, child) {
          return GestureDetector(
            onTap: () async {
              await vModel.changeCategory(id);
              await Provider.of<HomeViewModel>(context, listen: false).getImages(id);
            },
            child: Container(
              child: CustomContentText(text: name),
              padding: EdgeInsets.all(SizeConstants.size8),
              decoration: BoxDecoration(
                color: vModel.selectedCategoryId == id ? GlobalConstant.alternativeSoft : GlobalConstant.alternativeSoft.withOpacity(0.3),
                borderRadius: BorderRadius.circular(SizeConstants.size8),
              ),
            ),
          );
        },
      ),
    );
  }
}
