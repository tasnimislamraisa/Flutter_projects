import 'package:notiva_app/Data_Layer/models/read_model.dart';

class ReadProductModel {
  String? status;
  List<ReadModel>? data;

  ReadProductModel({this.status, this.data});

  ReadProductModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <ReadModel>[];
      json['data'].forEach((v) {
        data!.add(new ReadModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

