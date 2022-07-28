import 'dart:isolate';

import 'package:dart/services/http/client_http_service.dart';
import 'package:dart/services/http/http_service.dart';

final IHttpService httpService = ClientHttpService();

final int length = 100000;

void main() async {
  print('lets start with the load test... \n');
  final port = ReceivePort();
  for (int i = 0; i < 10000; i++) {
    await Isolate.spawn(sendRequests, port.sendPort);
  }
  
  print(await port.first as String);
}

Future<void> sendRequests(SendPort port) async {
  for (int i = 0; i < length; i++) {
    Isolate.exit(
        port, await httpService.get('http://localhost:8080'));
  }
}
