import 'dart:convert';

ResImage resImageFromJson(String str) => ResImage.fromJson(json.decode(str));

String resImageToJson(ResImage data) => json.encode(data.toJson());

class ResImage {
    ResImage({
        required this.id,
        required this.name,
        required this.imgUrl,
        required this.categoryId,
    });

    int id;
    String name;
    String imgUrl;
    int categoryId;

    factory ResImage.fromJson(Map<String, dynamic> json) => ResImage(
        id: json["id"],
        name: json["name"],
        imgUrl: json["imgUrl"],
        categoryId: json["categoryId"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "imgUrl": imgUrl,
        "categoryId": categoryId,
    };
}
