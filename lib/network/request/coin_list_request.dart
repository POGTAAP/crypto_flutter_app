import 'package:json_annotation/json_annotation.dart';
import 'network_request.dart';
part 'coin_list_request.g.dart';

@JsonSerializable()
class CoinListRequest extends NetworkRequest {
  CoinListRequest();

  @override
  String get endpoint => "cryptocurrency/listings/latest";

  @override
  get body => _$CoinListRequestToJson(this);
}
