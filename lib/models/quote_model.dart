import 'package:crypto_flutter_app/models/price_model.dart';

class QuoteModel {
  final PriceModel usdModel;

  QuoteModel({
    required this.usdModel,
  });
  factory QuoteModel.fromJson(Map<String, dynamic> json) {
    return QuoteModel(
      usdModel: PriceModel.fromJson(json["USD"]),
    );
  }
}