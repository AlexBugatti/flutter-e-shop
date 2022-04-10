
class ProductModel {

  int? id;
  String? name;
  String? category;
  String? image;
  String? price;
  String? description;

  ProductModel(
      {
        this.id,
        this.name,
        this.category,
        this.image,
        this.price,
        this.description
      }
      );
  ProductModel.fromJson(Map<String,dynamic> json)
  {
    id = json['id'];
    name = json['name'];
    category = json['category'];
    image = json['image'];
    price = json['price'];
    description = json['description'];
  }
}