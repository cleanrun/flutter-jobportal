import 'dart:convert';

class Company{
  final int id;
  final String username;
  final String password;
  final String company;
  final String location;
  final String category;
  final String web_address;
  final String overview;

  Company.fromJSON(Map<String, dynamic> jsonMap) :
      id = jsonMap['id'],
      username = jsonMap['username'],
      password = jsonMap['password'],
      company = jsonMap['company'],
      location = jsonMap['location'],
      category = jsonMap['category'],
      web_address = jsonMap['web_address'],
      overview = jsonMap['overview'];
}