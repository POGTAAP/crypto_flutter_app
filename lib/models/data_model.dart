import 'dart:convert';

import 'package:crypto_flutter_app/models/quote_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'data_model.g.dart';

@JsonSerializable()
class DataModel {
  final int id;
  final String name;
  final String symbol;
  final String slug;
  @JsonKey(name: "num_market_pairs")
  final int numMarketPairs;
  @JsonKey(name: "date_added")
  final String dateAdded;
  @JsonKey(name: "max_supply")
  final int? maxSupply;
  @JsonKey(name: "circulating_supply")
  final num circulatingSupply;
  @JsonKey(name: "total_supply")
  final num totalSupply;
  @JsonKey(name: "cmc_rank")
  final int cmcRank;
  @JsonKey(name: "last_updated")
  final String lastUpdated;
  @JsonKey(name: "quote")
 final QuoteModel quoteModel;

  DataModel(this.id, this.name, this.symbol, this.slug, this.numMarketPairs, this.dateAdded, this.maxSupply, this.circulatingSupply, this.totalSupply, this.cmcRank, this.lastUpdated,
      this.quoteModel);

  factory DataModel.fromJson(Map<String,dynamic> data) => _$DataModelFromJson(data);

  Map<String,dynamic> toJson() => _$DataModelToJson(this);

  static String encode(List<DataModel> coins) => json.encode(
    coins.map<Map<String, dynamic>>((coin) =>coin.toJson())
        .toList(),
  );

  static List<DataModel> decode(String coins) =>
      (json.decode(coins) as List<dynamic>)
          .map<DataModel>((item) => DataModel.fromJson(item))
          .toList();
}
