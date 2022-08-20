// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'price_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PriceModel _$PriceModelFromJson(Map<String, dynamic> json) => PriceModel(
      price: json['price'] as num,
      volume24h: json['volume_24h'] as num,
      percentChange_1h: json['percent_change_1h'] as num,
      percentChange_24h: json['percent_change_24h'] as num,
      percentChange_7d: json['percent_change_7d'] as num,
      percentChange_30d: json['percent_change_30d'] as num,
      percentChange_60d: json['percent_change_60d'] as num,
      percentChange_90d: json['percent_change_90d'] as num,
      marketCap: json['market_cap'] as num,
      lastUpdated: json['last_updated'] as String,
    );

Map<String, dynamic> _$PriceModelToJson(PriceModel instance) =>
    <String, dynamic>{
      'price': instance.price,
      'volume_24h': instance.volume24h,
      'percent_change_1h': instance.percentChange_1h,
      'percent_change_24h': instance.percentChange_24h,
      'percent_change_7d': instance.percentChange_7d,
      'percent_change_30d': instance.percentChange_30d,
      'percent_change_60d': instance.percentChange_60d,
      'percent_change_90d': instance.percentChange_90d,
      'market_cap': instance.marketCap,
      'last_updated': instance.lastUpdated,
    };
