import 'package:json_annotation/json_annotation.dart';
part 'status_model.g.dart';

@JsonSerializable()
class StatusModel {
  final String timestamp;
  final int errorCode;
  final String? errorMessage;
  final int elapsed;
  final int creditCount;
  final String? notice;
  final int totalCount;

  StatusModel(this.timestamp, this.errorCode, this.errorMessage, this.elapsed, this.creditCount, this.notice, this.totalCount);


  factory StatusModel.fromJson(Map<String,dynamic> data) => _$StatusModelFromJson(data);

  Map<String,dynamic> toJson() => _$StatusModelToJson(this);
}
