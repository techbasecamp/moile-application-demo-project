abstract class BaseApiService {
  final String baseUrl = "https://aramenstaffapi-3nh2ebcehq-de.a.run.app/";

  Future<dynamic> getResponse(String url, {String? token});
  Future<dynamic> postResponse(String url, Map<String, dynamic> jsonBody,
      {String? token});
}
