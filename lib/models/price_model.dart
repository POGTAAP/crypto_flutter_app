import 'package:json_annotation/json_annotation.dart';
part 'price_model.g.dart';

@JsonSerializable()
class PriceModel {
  final num price;
  final num volume24h;
  final num percentChange_1h;
  final num percentChange_24h;
  final num percentChange_7d;
  final num percentChange_30d;
  final num percentChange_60d;
  final num percentChange_90d;
  final num marketCap;
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



