import 'delete_model.dart';

class DeleteProductByIdModel {
  String? status;
  DeleteModel? deleteModel;

  DeleteProductByIdModel({this.status, this.deleteModel});

  DeleteProductByIdModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    deleteModel = json['data'] != null ? new DeleteModel.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.deleteModel != null) {
      data['data'] = this.deleteModel!.toJson();
    }
    return data;
  }
}

