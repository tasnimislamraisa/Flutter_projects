
import 'package:notiva_app/Data_Layer/models/product_model.dart';

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


