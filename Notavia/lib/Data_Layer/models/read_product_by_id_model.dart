class ReadProductByIdModel {
  String? status;
  List<Product>? product;

  ReadProductByIdModel({this.status, this.product});

  // Factory constructor to create the model from JSON
  ReadProductByIdModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      product = <Product>[]; // Create an empty list of Product
      json['data'].forEach((v) {
        product!.add(Product.fromJson(v)); // Populate the list with Product objects
      });
    }
  }

  // Convert model to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.product != null) {
      data['data'] = this.product!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

// Define a Product class to represent each item in the data list
class Product {
  String? id;
  String? name;
  double? price;

  Product({this.id, this.name, this.price});

  // Factory constructor to create Product from JSON
  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
  }

  // Convert Product to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['price'] = this.price;
    return data;
  }
}
