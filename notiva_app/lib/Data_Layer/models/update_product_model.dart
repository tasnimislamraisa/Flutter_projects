import 'package:notiva_app/Data_Layer/models/product_data_model.dart';

class UpdateProductModel {
  String? status;
  ProductDataModel? productDataModel;

  UpdateProductModel({this.status, this.productDataModel});

  UpdateProductModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    productDataModel = json['data'] != null ? new ProductDataModel.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.productDataModel != null) {
      data['data'] = this.productDataModel!.toJson();
    }
    return data;
  }
}

