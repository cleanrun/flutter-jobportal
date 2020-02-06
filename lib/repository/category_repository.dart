import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:job_portal/models/category.dart';

class CategoryRepository{
  final String mainUrl = "http://apijob.surveypuspa.com/api/category/";

  Future<Stream<Category>> getCategories() async{
    final client = new http.Client();
    final streamedRest = await client.send(http.Request('get', Uri.parse(this.mainUrl)));

    return streamedRest.stream
        .transform(utf8.decoder)
        .transform(json.decoder)
        .expand((data) => (data as List))
        .map((data) => Category.fromJSON(data));
  }

  Future<Category> getCategory(int id) async{
    final String url = this.mainUrl + id.toString();

    final call = await http.get(url);
    var jsonData = json.decode(call.body);
    Category category = Category.fromJSON(jsonData);

    return category;
  }

}