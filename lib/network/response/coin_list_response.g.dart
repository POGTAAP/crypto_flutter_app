// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coin_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoinListResponse _$CoinListResponseFromJson(Map<String, dynamic> json) =>
    CoinListResponse(
      StatusModel.fromJson(json['status'] as Map<String, dynamic>),
      (json['data'] as List<dynamic>)
          .map((e) => DataModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CoinListResponseToJson(CoinListResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
