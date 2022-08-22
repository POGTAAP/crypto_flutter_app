// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataModel _$DataModelFromJson(Map<String, dynamic> json) => DataModel(
      json['id'] as int,
      json['name'] as String,
      json['symbol'] as String,
      json['slug'] as String,
      json['num_market_pairs'] as int,
      json['date_added'] as String,
      json['max_supply'] as int?,
      json['circulating_supply'] as num,
      json['total_supply'] as num,
      json['cmc_rank'] as int,
      json['last_updated'] as String,
      QuoteModel.fromJson(json['quote'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataModelToJson(DataModel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'symbol': instance.symbol,
      'slug': instance.slug,
      'num_market_pairs': instance.numMarketPairs,
      'date_added': instance.dateAdded,
      'max_supply': instance.maxSupply,
      'circulating_supply': instance.circulatingSupply,
      'total_supply': instance.totalSupply,
      'cmc_rank': instance.cmcRank,
      'last_updated': instance.lastUpdated,
      'quote': instance.quoteModel,
    };
