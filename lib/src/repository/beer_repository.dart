import 'dart:convert';

import 'package:flutter_api/src/models/beer.dart';
import 'package:http/http.dart' as http;

Future<Stream<Beer>> getBeer() async {
  final String url = 'https://api.punkapi.com/v2/beers';
  final client = new http.Client();
  final streamdRead = await client.send(
    http.Request('get', Uri.parse(url))
  );

  return streamdRead.stream
    .transform(utf8.decoder)
    .transform(json.decoder)
    .expand((data) => (data as List))
    .map((data) => Beer.fromJSON(data));
}