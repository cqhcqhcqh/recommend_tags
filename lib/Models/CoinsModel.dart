import 'package:json_annotation/json_annotation.dart';
import '../Tools/HTTPClient.dart';
part 'CoinsModel.g.dart';

@JsonSerializable()
class CoinsModel extends SimpleHTTPResponse {
  final List<CoinModel> coins;
  CoinsModel({required this.coins});
  Map<String, dynamic> toJson() => _$CoinsModelToJson(this);
  factory CoinsModel.fromJson(Map<String, dynamic> json) =>
      _$CoinsModelFromJson(json);
}

@JsonSerializable()
class CoinModel {
  final String price;
  final double coin;
  CoinModel({required this.price, required this.coin});
  Map<String, dynamic> toJson() => _$CoinModelToJson(this);
  factory CoinModel.fromJson(Map<String, dynamic> json) =>
      _$CoinModelFromJson(json);
}
