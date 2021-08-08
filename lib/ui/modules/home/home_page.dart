import 'package:flutter/material.dart';
import 'package:wallpaper_house/core/constants/global_constants.dart';
import 'package:wallpaper_house/core/constants/size_constant.dart';
import 'package:wallpaper_house/core/widgets/oe_custom_content_text.dart';
import 'package:wallpaper_house/ui/modules/home/image_detail_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [headerLogo(context), categoryWidget(context), listImages(context)],
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

  Widget categoryWidget(context) {
    final _categoryItem = [
      categoryItem(name: "Atatürk"),
      categoryItem(name: "Osmanlı"),
      categoryItem(name: "Türkiye"),
      categoryItem(name: "Almanya"),
      categoryItem(name: "Hollanda"),
      categoryItem(name: "İkoçya"),
      categoryItem(name: "Orman"),
      categoryItem(name: "Sanat"),
    ];
    return Container(
      height: MediaQuery.of(context).size.height * 0.1,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: _categoryItem,
        ),
      ),
    );
  }

  Widget categoryItem({required String name}) {
    return Padding(
      padding: const EdgeInsets.all(SizeConstants.size8),
      child: Container(
        child: CustomContentText(text: name),
        padding: EdgeInsets.all(SizeConstants.size8),
        decoration: BoxDecoration(
          color: GlobalConstant.alternativeSoft.withOpacity(0.6),
          borderRadius: BorderRadius.circular(SizeConstants.size8),
        ),
      ),
    );
  }

  Widget listImages(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.8,
      child: GridView.builder(
        itemCount: 40,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 1, mainAxisSpacing: 1),
        itemBuilder: (context, i) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          ImageDetailPage(imgUrl: "https://cdn.pixabay.com/photo/2019/07/01/14/30/squirrel-4310069_960_720.jpg")));
            },
            child: Image.network(
              "https://cdn.pixabay.com/photo/2019/07/01/14/30/squirrel-4310069_960_720.jpg",
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }
}
