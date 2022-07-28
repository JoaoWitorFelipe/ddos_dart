import 'package:http/http.dart' as http;

import './http_service.dart';

class ClientHttpService implements IHttpService {
  final http.Client client = http.Client();

  @override
  Future<String> get(String url) async {
    final response = await client.get(Uri.parse(url));
    return response.body;
  }
}
