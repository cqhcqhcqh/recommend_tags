// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CoinsModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoinsModel _$CoinsModelFromJson(Map<String, dynamic> json) => CoinsModel(
      coins: (json['coins'] as List<dynamic>)
          .map((e) => CoinModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CoinsModelToJson(CoinsModel instance) =>
    <String, dynamic>{
      'coins': instance.coins,
    };

CoinModel _$CoinModelFromJson(Map<String, dynamic> json) => CoinModel(
    price: (json['price'] as String).toString(),
    coin: (json['coin'] as num).toDouble());

Map<String, dynamic> _$CoinModelToJson(CoinModel instance) => <String, dynamic>{
      'price': instance.price,
      'coin': instance.coin,
    };
