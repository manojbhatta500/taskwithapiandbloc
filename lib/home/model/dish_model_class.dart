class DishModelClass {
  String? id;
  List<Products>? products;
  String? name;
  String? status;

  DishModelClass({this.id, this.products, this.name, this.status});

  DishModelClass.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    print('JSON Products: ${json['products']}'); // Add this line
    if (json['products'] != null) {
      products = List<Products>.from(
          json['products'].map((product) => Products.fromJson(product)));
      print('Parsed Products: $products'); // Add this line
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
  num? price;
  num? rating;
  num? noOfRating;
  num? crossedPrice;
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
