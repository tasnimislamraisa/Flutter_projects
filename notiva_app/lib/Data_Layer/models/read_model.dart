class ReadModel {
  String? id; // Renamed from sId to id for clarity
  String? title; // Corresponding to productName in CreateProductModel
  String? description; // New field corresponding to the functionality
  String? image; // Corresponding to img
  int? qty;
  int? unitPrice;
  int? totalPrice;

  // Constructor with optional named parameters
  ReadModel({
    this.id,
    this.title,
    this.description,
    this.image,
    this.qty,
    this.unitPrice,
    this.totalPrice,
  });

  // Factory constructor to create an instance from JSON
  factory ReadModel.fromJson(Map<String, dynamic> json) {
    return ReadModel(
      id: json['_id'], // Note: id field mapped from '_id'
      title: json['Title'], // Changed key from 'ProductName' to 'Title'
      description: json['Description'], // New field for description
      image: json['Image'], // Changed key from 'Img' to 'Image'
      qty: json['Qty'],
      unitPrice: json['UnitPrice'],
      totalPrice: json['TotalPrice'],
    );
  }

  // Method to convert an instance into JSON format
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = id; // Include id
    data['Title'] = title; // Changed key from 'ProductName' to 'Title'
    data['Description'] = description; // New field for description
    data['Image'] = image; // Changed key from 'Img' to 'Image'
    data['Qty'] = qty;
    data['UnitPrice'] = unitPrice;
    data['TotalPrice'] = totalPrice;
    return data;
  }
}
