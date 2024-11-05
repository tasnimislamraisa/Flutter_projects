class CreateProductModel {
  String? title;
  String? description;
  String? image; // Optional image field

  CreateProductModel({this.title, this.description, this.image});

  // Factory constructor to create an instance from JSON
  CreateProductModel.fromJson(Map<String, dynamic> json) {
    title = json['Title'];
    description = json['Description'];
    image = json['Image'];
  }

  // Method to convert the instance into JSON format
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Title'] = this.title;
    data['Description'] = this.description;
    if (this.image != null) {
      data['Image'] = this.image; // Image is optional, only added if not null
    }
    return data;
  }
}
