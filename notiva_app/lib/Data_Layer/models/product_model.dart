// Define a Product class to represent each item in the data list
class Product {
  String? id;
  String? title;
  double? price;
  String? content;
  String? dateCreated;


  Product({this.id, this.title, this.price,this.content,
    this.dateCreated,});

  // Factory constructor to create Product from JSON
  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title= json['title'];
    price = json['price'];

    content= json['content'];
    dateCreated=json['dateCreated'];
  }

  // Convert Product to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.title;
    data['price'] = this.price;
    return data;
  }
}