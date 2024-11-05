
class ProductDataModel {
  bool? acknowledged;
  int? modifiedCount;
  Null? upsertedId;
  int? upsertedCount;
  int? matchedCount;
//  List<Product>? product; // Add a list of products

  ProductDataModel(
      {this.acknowledged,
        this.modifiedCount,
        this.upsertedId,
        this.upsertedCount,
        this.matchedCount});

  ProductDataModel.fromJson(Map<String, dynamic> json) {
    acknowledged = json['acknowledged'];
    modifiedCount = json['modifiedCount'];
    upsertedId = json['upsertedId'];
    upsertedCount = json['upsertedCount'];
    matchedCount = json['matchedCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> product = new Map<String, dynamic>();
    product['acknowledged'] = this.acknowledged;
    product['modifiedCount'] = this.modifiedCount;
    product['upsertedId'] = this.upsertedId;
    product['upsertedCount'] = this.upsertedCount;
    product['matchedCount'] = this.matchedCount;
    return product;
  }
}