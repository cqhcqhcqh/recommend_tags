import 'dart:ffi';

import '../Models/HashTagsModel.dart';
import '../Tools/HTTPClient.dart';
import '../Models/TagCatesModel.dart';

class CatesRemoteAPI {
  Future<TagCates?> get(Uri uri) async {
    final String path = '/home/coins';
    await Future<Void>.delayed(Duration(seconds: 3));
    return TagCates.fromJson(cates);
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
