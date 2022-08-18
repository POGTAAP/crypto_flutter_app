import 'package:json_annotation/json_annotation.dart';

import '../../models/data_model.dart';
import '../../models/status_model.dart';
part 'coin_list_response.g.dart';

@JsonSerializable()
class CoinListResponse {
  final StatusModel status;
  final List<DataModel> data;


  CoinListResponse(this.status, this.data);

  factory CoinListResponse.fromJson(Map<String,dynamic> data) => _$CoinListResponseFromJson(data);

  Map<String,dynamic> toJson() => _$CoinListResponseToJson(this);
}