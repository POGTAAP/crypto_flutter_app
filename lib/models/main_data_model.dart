import 'package:crypto_flutter_app/models/status_model.dart';

import 'data_model.dart';

class MainDataModel{
  final StatusModel statusModel;
  final List<DataModel> dataModel;

  MainDataModel({required this.statusModel,required this.dataModel});

  factory MainDataModel.fromJson(Map<String, dynamic> json) {
    var dataList = json['data'] as List;
    List<DataModel> dataModelList =
    dataList.map((e) => DataModel.fromJson(e)).toList();
    return MainDataModel(
      statusModel: StatusModel.fromJson(json["status"]),
      dataModel: dataModelList,
    );
  }
  MainDataModel.withError(String error)
      : statusModel = StatusModel(error, 0, error, 0, 0, error, 0),
        dataModel = [];

}