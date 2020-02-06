import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:job_portal/models/beer.dart';

Future<Stream<Beer>> getBeers() async {
  final String url = 'https://api.punkapi.com/v2/beers';

  final client = new http.Client();
  final streamedRest = await client.send(http.Request('get', Uri.parse(url)));

  return streamedRest.stream
      .transform(utf8.decoder)
      .transform(json.decoder)
      .expand((data) => (data as List))
      .map((data) => Beer.fromJSON(data));
}

Future<Beer> getBeer(int id) async{
  final String url = 'https://api.punkapi.com/v2/beers/' + id.toString();

  final call = await http.get(url);
  var jsonData = json.decode(call.body);
  Beer beer = Beer.fromJSON(jsonData[0]);

  return beer;
}