import 'package:json_annotation/json_annotation.dart';
part 'price_model.g.dart';

@JsonSerializable()
class PriceModel {
  final num price;
  @JsonKey(name: "volume_24h")
  final num volume24h;
  @JsonKey(name: "percent_change_1h")
  final num percentChange_1h;
  @JsonKey(name: "percent_change_24h")
  final num percentChange_24h;
  @JsonKey(name: "percent_change_7d")
  final num percentChange_7d;
  @JsonKey(name: "percent_change_30d")
  final num percentChange_30d;
  @JsonKey(name: "percent_change_60d")
  final num percentChange_60d;
  @JsonKey(name: "percent_change_90d")
  final num percentChange_90d;
  @JsonKey(name: "market_cap")
  final num marketCap;
  @JsonKey(name: "last_updated")
  final String lastUpdated;

  PriceModel(
      {required this.price,
        required this.volume24h,
        required this.percentChange_1h,
        required this.percentChange_24h,
        required this.percentChange_7d,
        required this.percentChange_30d,
        required this.percentChange_60d,
        required this.percentChange_90d,
        required this.marketCap,
        required this.lastUpdated});


  factory PriceModel.fromJson(Map<String,dynamic> data) => _$PriceModelFromJson(data);

  Map<String,dynamic> toJson() => _$PriceModelToJson(this);
}



