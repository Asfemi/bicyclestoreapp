class BikeModel {
  double? price;
  String? description;
  String? imageUrl;
  String? smallDescription;

  BikeModel({
    this.price,
    this.description,
    this.imageUrl,
    this.smallDescription,
  });

  BikeModel.fromJson(Map<String, dynamic> json) {
    price = json['price'];
    description = json['description'];
    imageUrl = json['imageUrl'];
    smallDescription = json['smallDescription'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['price'] = price;
    data['description'] = description;
    data['imageUrl'] = imageUrl;
    data['smallDescription'] = smallDescription;
    return data;
  }
}
