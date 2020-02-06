import 'dart:convert';

class Beer{
  final int id;
  final String name;
  final String tagline;
  final String description;
  final String image_url;
  final String brewers_tips;

  Beer.fromJSON(Map<String, dynamic> jsonMap) :
      id = jsonMap['id'],
      name = jsonMap['name'],
      tagline = jsonMap['tagline'],
      description = jsonMap['description'],
      image_url = jsonMap['image_url'],
      brewers_tips = jsonMap['brewers_tips'];
}