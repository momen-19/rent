
class CategoryModel {
  late String name, image,id;

  CategoryModel({required this.name, required this.image});

   CategoryModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }
    name = map['name'];
    image = map['image'];
  }

  Map<String , Object> toMap() {
    return {
      'name': name,
      'image': image,
    };
  }
}