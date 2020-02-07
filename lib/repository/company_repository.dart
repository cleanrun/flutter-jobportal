import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:job_portal/models/company.dart';
import 'package:job_portal/utils/constants.dart';

class CompanyRepository{
  final String mainUrl = Constants.parentUrl + "company/";

  Future<Stream<Company>> getCompanies() async{
    final client = new http.Client();
    final streamedRest = await client.send(http.Request('get', Uri.parse(this.mainUrl)));

    return streamedRest.stream
        .transform(utf8.decoder)
        .transform(json.decoder)
        .expand((data) => (data as List))
        .map((data) => Company.fromJSON(data));
  }

  Future<Company> getCompany(int id) async{
    final String url = this.mainUrl + id.toString();

    final call = await http.get(url);
    var jsonData = json.decode(call.body);
    Company company = Company.fromJSON(jsonData);

    return company;
  }
}