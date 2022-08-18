import 'package:crypto_flutter_app/models/status_model.dart';
import 'package:json_annotation/json_annotation.dart';

import 'data_model.dart';
part 'main_data_model.g.dart';

@JsonSerializable()
class MainDataModel{
  final StatusModel statusModel;
  final List<DataModel> dataModel;

  MainDataModel({required this.statusModel,required this.dataModel});


  factory MainDataModel.fromJson(Map<String,dynamic> data) => _$MainDataModelFromJson(data);

  Map<String,dynamic> toJson() => _$MainDataModelToJson(this);
}