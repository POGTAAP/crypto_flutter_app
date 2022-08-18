import 'package:json_annotation/json_annotation.dart';

import '../../models/data_model.dart';
import '../../models/status_model.dart';
part 'coin_list_response.g.dart';

@JsonSerializable()
class CoinListResponse {
  final StatusModel statusModel;
  final List<DataModel> dataModel;


  CoinListResponse(this.statusModel, this.dataModel);

  factory CoinListResponse.fromJson(Map<String,dynamic> data) => _$CoinListResponseFromJson(data);

  Map<String,dynamic> toJson() => _$CoinListResponseToJson(this);
}