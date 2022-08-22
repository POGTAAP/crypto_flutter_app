import 'dart:convert';

import 'package:crypto_flutter_app/models/price_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'quote_model.g.dart';

@JsonSerializable()
class QuoteModel {

  @JsonKey(name: "USD")
  final PriceModel priceModel;

  QuoteModel({
    required this.priceModel,
  });

  factory QuoteModel.fromJson(Map<String,dynamic> data) => _$QuoteModelFromJson(data);

  Map<String,dynamic> toJson() => _$QuoteModelToJson(this);

  static List<QuoteModel> decode(String coins) =>
      (json.decode(coins) as List<dynamic>)
          .map<QuoteModel>((item) => QuoteModel.fromJson(item))
          .toList();
}
