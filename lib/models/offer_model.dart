class OfferModel {
  late String name, image,id,des,price;
  late double rating;

  OfferModel({required this.name, required this.image,required this.price,required this.des,required this.rating});

  OfferModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }
    name = map['name'];
    image = map['image'];
    price = map['price'];
    des = map['des'];
    rating = map['rating'];
  }

  Map<String , Object> toMap() {
    return {
      'name': name,
      'image': image,
      'price': price,
      'des': des,
      'rating': rating,
    };
  }
}