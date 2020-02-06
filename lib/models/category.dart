import 'dart:convert';

class Category{
  final int id;
  final String name;
  //final String image_url;

  Category.fromJSON(Map<String, dynamic> jsonMap) :
    id = jsonMap['id'],
    name = jsonMap['category'];
    //image_url = jsonMap['image_url'];
}