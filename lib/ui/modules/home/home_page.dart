import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallpaper_house/core/models/base_view_model.dart';
import 'package:wallpaper_house/core/widgets/oe_custom_circular_spinner.dart';
import 'package:wallpaper_house/core/widgets/oe_custom_content_text.dart';
import 'package:wallpaper_house/core/widgets/oe_custom_not_found_item.dart';
import 'package:wallpaper_house/ui/modules/category/category_horizontal.dart';
import 'package:wallpaper_house/ui/modules/home/home_view_model.dart';
import 'package:wallpaper_house/ui/modules/home/image_detail_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [headerLogo(context), CategoryHorizontal(), listImages(context)],
      ),
    );
  }

  Widget headerLogo(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.1,
      child: Center(
        child: CustomContentText(
          text: "LOGO",
        ),
      ),
    );
  }

  Widget listImages(BuildContext context) {
    final listImage = [];
    return Consumer<HomeViewModel>(
      builder: (context, vModel, child) {
        if (vModel.state == BaseState.Initial) {
          vModel.getImages(0);
          return OeCustomSpinner();
        } else if (vModel.state == BaseState.Busy) {
          return OeCustomSpinner();
        } else if (vModel.state == BaseState.Done) {
          return Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.8,
            child: GridView.builder(
              padding: EdgeInsets.zero,
              itemCount: vModel.listImage.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 5, mainAxisSpacing: 5),
              itemBuilder: (context, i) {
                var img = vModel.listImage[i];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ImageDetailPage(image: img)));
                  },
                  child: Image.network(
                    img.imgUrl,
                    fit: BoxFit.cover,
                  ),
                );
              },
            ),
          );
        } else {
          return OeCustomNotFoundItem();
        }
      },
    );
  }
}
