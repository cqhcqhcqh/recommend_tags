import 'dart:ffi';

import '../Models/HashTagsModel.dart';
import '../Tools/HTTPClient.dart';
import '../Models/CoinsModel.dart';

class TagsRemoteAPI {
  Future<CoinsModel?> get() async {
    final String path = '/home/coins';
    await Future<Void>.delayed(Duration(seconds: 3));
    return CoinsModel.fromJson(coins);
    final response = await httpClient.get(path);
    if (response.data == null) {
      return null;
    }
    return CoinsModel.fromJson(response.data!["data"]);
  }
}

final Map<String, dynamic> coins = {
  'cates': [
    {
      'coin': 100,
      'prices': '\$0.99',
    },
    {
      'coin': 300,
      'price': '\$2.99',
    },
    {
      'coin': 520,
      'price': '\$4.99',
    },
    {
      'coin': 520,
      'price': '\$9.99',
    },
  ]
};
