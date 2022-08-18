import 'package:json_annotation/json_annotation.dart';

part 'status_model.g.dart';

@JsonSerializable()
class StatusModel {
  @JsonKey(name: "timestamp")
  final String timestamp;
  @JsonKey(name: "error_code")
  final int errorCode;
  @JsonKey(name: "error_message")
  final String? errorMessage;
  @JsonKey(name: "elapsed")
  final int elapsed;
  @JsonKey(name: "credit_count")
  final int creditCount;
  final String? notice;
  @JsonKey(name: "total_count")
  final int totalCount;

  StatusModel(this.timestamp, this.errorCode, this.errorMessage, this.elapsed, this.creditCount, this.notice, this.totalCount);

  factory StatusModel.fromJson(Map<String, dynamic> data) => _$StatusModelFromJson(data);

  Map<String, dynamic> toJson() => _$StatusModelToJson(this);
}
