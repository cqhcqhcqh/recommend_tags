import '../Models/HashTagsModel.dart';
import '../Tools/HTTPClient.dart';
import '../Models/CoinsModel.dart';

class TagsRemoteAPI {
  Future<CoinsModel?> get(Uri uri) async {
    final response = await httpClient.get(uri);
    if (response.data == null) {
      return null;
    }
    return CoinsModel.fromJson(response.data!["data"]);
  }
}
