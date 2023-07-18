import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:http_interceptor/http_interceptor.dart';
import 'package:moneyer/models/crypto_model.dart';

/*class LoggingInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({required RequestData data}) async {
    debugPrint('REQUEST');
    debugPrint('URL: ${data.url}');
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({required ResponseData data}) async {
    debugPrint('\nRESPONSE');
    debugPrint('STATUS CODE: ${data.statusCode}');
    debugPrint('HEADERS: ${data.headers}');
    debugPrint('BODY: ${data.body}');

    return data;
  }
}

Future<Crypto?> fetch(String item) async {
  Client client = InterceptedClient.build(
    interceptors: [LoggingInterceptor()],
    requestTimeout: const Duration(seconds: 5),
  );

  final Response response =
      await client.get(Uri.parse("https://brapi.dev/api/v2/crypto?coin=$item"));
  if (response.statusCode != 200) return null;
  return Crypto.fromJson(jsonDecode(response.body));
}*/

Future<Crypto?> fetchCoin(String coin) async {
  final response = await http
      .get(Uri.parse('https://brapi.dev/api/v2/crypto?coin=$coin'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Crypto.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load crypto');
  }
}