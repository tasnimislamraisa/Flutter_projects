class DeleteModel {
  bool? acknowledged;
  int? deletedCount;

  DeleteModel({this.acknowledged, this.deletedCount});

  DeleteModel.fromJson(Map<String, dynamic> json) {
    acknowledged = json['acknowledged'];
    deletedCount = json['deletedCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['acknowledged'] = this.acknowledged;
    data['deletedCount'] = this.deletedCount;
    return data;
  }
}