import '../Models/HashTagsModel.dart';
import '../Tools/HTTPClient.dart';
import '../Models/TagCatesModel.dart';

class CatesRemoteAPI {
  Future<TagCates?> get(Uri uri) async {
    final response = await httpClient.get(uri);
    if (response.data == null) {
      return null;
    }
    return TagCates.fromJson(response.data!["data"]);
  }
}
