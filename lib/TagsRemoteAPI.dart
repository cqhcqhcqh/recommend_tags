import 'HashTagsModel.dart';
import 'HTTPClient.dart';

class TagsRemoteAPI {
  Future<HashTags?> get(Uri uri) async {
    final response = await httpClient.get(uri);
    if (response.data == null) {
      return null;
    }
    return HashTags.fromJson(response.data!["data"]);
  }
}
