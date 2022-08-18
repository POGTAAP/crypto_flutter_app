import 'package:crypto_flutter_app/models/quote_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'data_model.g.dart';

@JsonSerializable()
class DataModel {
  final int id;
  final String name;
  final String symbol;
  final String slug;
  final int numMarketPairs;
  final String dateAdded;
  final List<dynamic> tags;
  final int maxSupply;
  final num circulatingSupply;
  final num totalSupply;
  final int cmcRank;
  final String lastUpdated;
  final QuoteModel quoteModel;

  DataModel(this.id, this.name, this.symbol, this.slug, this.numMarketPairs, this.dateAdded, this.tags, this.maxSupply, this.circulatingSupply, this.totalSupply, this.cmcRank, this.lastUpdated,
      this.quoteModel);

  factory DataModel.fromJson(Map<String,dynamic> data) => _$DataModelFromJson(data);

  Map<String,dynamic> toJson() => _$DataModelToJson(this);
}
