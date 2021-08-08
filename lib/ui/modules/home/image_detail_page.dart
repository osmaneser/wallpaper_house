import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallpaper_house/core/constants/size_constant.dart';
import 'package:wallpaper_house/core/services/dialog_service.dart';
import 'package:wallpaper_house/core/widgets/oe_button.dart';
import 'package:wallpaper_house/core/widgets/oe_custom_app_bar.dart';
import 'package:wallpaper_house/core/widgets/oe_custom_content_text.dart';
import 'package:wallpaper_house/ui/models/res_image.dart';
import 'package:wallpaper_house/ui/modules/home/image_detail_view_model.dart';

class ImageDetailPage extends StatelessWidget {
  final ResImage image;
  const ImageDetailPage({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appBar = PreferredSize(
      child: OeCustomAppBar(title: CustomContentText(text: image.name)),
      preferredSize: Size.fromHeight(50.0),
    );
    return Scaffold(
      appBar: appBar,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(flex: 90, child: getImage(context, image.imgUrl, appBar.preferredSize.height)),
            Expanded(flex: 10, child: getButtons(context)),
          ],
        ),
      ),
    );
  }

  Widget getImage(BuildContext context, String imgUrl, double height) {
    return Image.network(
      imgUrl,
      fit: BoxFit.cover,
    );
  }

  Widget getButtons(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(SizeConstants.size8),
      child: Row(
        children: [
          Expanded(
              flex: 5,
              child: OeButton(
                  onTap: () async {
                    DialogService.confirmDialog(
                        title: "Onay",
                        content: CustomContentText(text: "Ana ekrana ayarlamak istediğinize emin misiniz?"),
                        context: context,
                        confirmText: "Evet",
                        onTap: () async {
                          await Provider.of<ImageDetailViewModel>(context, listen: false).setWallpaper(context: context, img: image.imgUrl);
                        });
                  },
                  text: "Set Wallpaper")),
          Spacer(flex: 1),
          Expanded(flex: 5, child: OeButton(onTap: () async{
            await Provider.of<ImageDetailViewModel>(context, listen: false).downloadImage(image.imgUrl);
          }, text: "Download")),
        ],
      ),
    );
  }
}
