import 'dart:ffi';
import '../Models/HashTagsModel.dart';
import '../Tools/HTTPClient.dart';

class TagsRemoteAPI {
  Future<List<HashTags>?> get() async {
    final path = '/home/tags';
    await Future.delayed(const Duration(seconds: 3));
    return allHashTagsFromJson(tags);
    // final response = await httpClient.get(path);
    // if (response.data == null) {
    //   return null;
    // }
    // return HashTags.fromJson(response.data!["data"]);
  }
}

final Map<String, dynamic> tags = {
  'tags': [
    {
      'cost': 10,
      'labels': [
        {'name': 'staysafe'},
        {'name': 'staysafe'},
        {'name': 'staysafe'},
        {'name': 'staysafe'},
        {'name': 'staysafe'}
      ]
    },
    {
      'cost': 10,
      'labels': [
        {'name': 'staysafe'},
        {'name': 'staysafe'},
        {'name': 'staysafe'},
        {'name': 'staysafe'},
        {'name': 'staysafe'},
        {'name': 'staysafe'},
        {'name': 'staysafe'},
        {'name': 'staysafe'}
      ]
    },
    {
      'cost': 10,
      'labels': [
        {'name': 'staysafe'},
        {'name': 'staysafe'},
        {'name': 'staysafe'},
        {'name': 'staysafe'}
      ]
    },
  ]
};
