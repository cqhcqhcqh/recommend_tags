import '../Tools/HTTPClient.dart';
import '../Models/TagCatesModel.dart';

class CatesRemoteAPI {
  TagCates? _cached;
  TagCates? get cached => _cached;

  Future<TagCates?> get() async {
    final String path = '/home/coins';
    await Future.delayed(Duration(seconds: 3));
    _cached = TagCates.fromJson(cates);
    return _cached;
    final response = await httpClient.get(path);
    if (response.data == null) {
      return null;
    }
    return TagCates.fromJson(response.data!["data"]);
  }
}

final Map<String, dynamic> cates = {
  'cates': [
    {
      'name': 'SassyCaption',
    },
    {
      'name': 'Valentine',
    },
    {
      'name': 'Trending',
    },
  ]
};
