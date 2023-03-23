import '../Tools/HTTPClient.dart';
import '../Models/CoinsModel.dart';

class CoinsRemoteAPI {
  CoinsModel? _cached;
  CoinsModel? get cached => _cached;

  Future<CoinsModel?> get() async {
    final String path = '/home/coins';
    await Future.delayed(Duration(seconds: 3));
    _cached = CoinsModel.fromJson(coins);
    return _cached;
    final response = await httpClient.get(path);
    if (response.data == null) {
      return null;
    }
    return CoinsModel.fromJson(response.data!["data"]);
  }
}

final Map<String, dynamic> coins = {
  'coins': [
    {
      'coin': 100,
      'price': '\$0.99',
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
