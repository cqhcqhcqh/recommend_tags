import 'package:json_annotation/json_annotation.dart';
part 'CoinsModel.g.dart';

@JsonSerializable()
class CoinsModel {
  final List<CoinModel> coins;
  CoinsModel({required this.coins});
  Map<String, dynamic> toJson() => _$CoinsModelToJson(this);
  factory CoinsModel.fromJson(Map<String, dynamic> json) =>
      _$CoinsModelFromJson(json);
}

@JsonSerializable()
class CoinModel {
  final double price;
  final double coin;
  CoinModel({required this.price, required this.coin});
  Map<String, dynamic> toJson() => _$CoinModelToJson(this);
  factory CoinModel.fromJson(Map<String, dynamic> json) =>
      _$CoinModelFromJson(json);
}
