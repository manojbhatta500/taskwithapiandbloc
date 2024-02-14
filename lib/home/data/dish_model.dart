class DishModel {
  String? id;
  List<Products>? products;
  String? name;
  String? status;

  DishModel({this.id, this.products, this.name, this.status});

  DishModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
    name = json['name'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    data['name'] = this.name;
    data['status'] = this.status;
    return data;
  }
}

class Products {
  String? name;
  String? category;
  num? price; // Change type to num
  num? rating;
  num? noOfRating; // Change type to num
  num? crossedPrice; // Change type to num
  String? image;

  Products({
    this.name,
    this.category,
    this.price,
    this.rating,
    this.noOfRating,
    this.crossedPrice,
    this.image,
  });

  Products.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    category = json['category'];
    price = json['price'];
    rating = json['rating'];
    noOfRating = json['no_of_rating'];
    crossedPrice = json['crossed_price'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['category'] = this.category;
    data['price'] = this.price;
    data['rating'] = this.rating;
    data['no_of_rating'] = this.noOfRating;
    data['crossed_price'] = this.crossedPrice;
    data['image'] = this.image;
    return data;
  }
}
