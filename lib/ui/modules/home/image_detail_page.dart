import 'package:flutter/material.dart';
import 'package:wallpaper_house/core/constants/size_constant.dart';
import 'package:wallpaper_house/core/widgets/oe_button.dart';
import 'package:wallpaper_house/core/widgets/oe_custom_app_bar.dart';

class ImageDetailPage extends StatelessWidget {
  final String imgUrl;
  const ImageDetailPage({Key? key, required this.imgUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appBar = PreferredSize(child: OeCustomAppBar(title: Text("data")), preferredSize: Size(MediaQuery.of(context).size.width, 50));
    return Scaffold(
      appBar: appBar,
      body: SafeArea(
        child: Column(
          children: [getImage(context, imgUrl, appBar.preferredSize.height), getButtons(context)],
        ),
      ),
    );
  }

  Widget getImage(BuildContext context, String imgUrl, double height) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: (MediaQuery.of(context).size.height * 0.9) - (height),
      child: Image.network(
        imgUrl,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget getButtons(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * .1,
      child: Padding(
        padding: const EdgeInsets.all(SizeConstants.size8),
        child: Row(
          children: [
            Expanded(flex: 5, child: OeButton(onTap: () {}, text: "Set Wallpaper")),
            Spacer(flex: 1),
            Expanded(flex: 5, child: OeButton(onTap: () {}, text: "Download")),
          ],
        ),
      ),
    );
  }
}
