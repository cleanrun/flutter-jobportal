import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:job_portal/models/job.dart';

class JobRepository{
  final String mainUrl = "http://apijob.surveypuspa.com/api/job-detail/";

  Future<Stream<Job>> getJobs() async{
    final client = new http.Client();
    final streamedRest = await client.send(http.Request('get', Uri.parse(this.mainUrl)));
    
    return streamedRest.stream
        .transform(utf8.decoder)
        .transform(json.decoder)
        .expand((data) => (data as List))
        .map((data) => Job.fromJSON(data));
  }

  Future<Job> getJob(int id) async{
    final String url = this.mainUrl + id.toString();
    //print(url);

    final call = await http.get(url);
    var jsonData = json.decode(call.body);
    Job job = Job.fromJSON(jsonData);

    return job;
  }
}